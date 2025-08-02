use anyhow::Result;
use clap::Parser;
use gcode_inertia::interpreter::parse_segments;
use nalgebra::{Matrix3, Vector3};
use serde::Serialize;
use std::fs;

#[derive(Parser, Debug)]
#[command(name = "gcode-inertia")]
#[command(about = "Calculate mass and inertia properties from G-code files")]
#[command(long_about = "Calculate mass and inertia properties from G-code files.

COORDINATE SYSTEM WARNING:
All values are calculated in the 3D printer's coordinate frame!
- Origin: Printer home position (typically front-left corner at Z=0)
- X: Left to right on print bed
- Y: Front to back on print bed  
- Z: Vertical (bed to nozzle)

For URDF/robotics applications you MUST:
1. Transform the center of mass to your part's local coordinate frame
2. Rotate the inertia tensor if part orientation differs from print orientation

Example: If you print a link standing up (along Z) but mount it horizontally,
you need to apply the appropriate rotation transformation to the inertia tensor.")]
struct Args {
    /// Path to the G-code file
    #[arg(short, long)]
    file: String,

    /// Filament diameter in mm (default: 1.75)
    #[arg(short, long, default_value = "1.75")]
    diameter: f32,

    /// Filament density in g/cm³ (default: 1.25 for PLA)
    #[arg(short = 'D', long, default_value = "1.25")]
    density: f32,

    /// Output format (json or urdf)
    #[arg(short, long, default_value = "json")]
    output: OutputFormat,
}

#[derive(Debug, Clone, Copy, clap::ValueEnum)]
enum OutputFormat {
    Json,
    Urdf,
}

#[derive(Serialize)]
struct InertiaOutput {
    mass: f32,
    center_of_mass: [f32; 3],
    inertia_origin: InertiaMatrix,
    inertia_com: InertiaMatrix,
}

#[derive(Serialize)]
struct InertiaMatrix {
    ixx: f32,
    iyy: f32,
    izz: f32,
    ixy: f32,
    ixz: f32,
    iyz: f32,
}

impl From<Matrix3<f32>> for InertiaMatrix {
    fn from(m: Matrix3<f32>) -> Self {
        Self {
            ixx: m[(0, 0)],
            iyy: m[(1, 1)],
            izz: m[(2, 2)],
            ixy: m[(0, 1)],
            ixz: m[(0, 2)],
            iyz: m[(1, 2)],
        }
    }
}

fn main() -> Result<()> {
    let args = Args::parse();

    // Read G-code file
    let gcode_content = fs::read_to_string(&args.file)?;

    // Parse segments
    let segments = parse_segments(&gcode_content, args.diameter, args.density);

    if segments.is_empty() {
        eprintln!("Warning: No extrusion segments found in G-code");
        return Ok(());
    }

    // Calculate total mass and center of mass
    let total_mass: f32 = segments.iter().map(|s| s.mass()).sum();
    let mut weighted_com = Vector3::zeros();

    for segment in &segments {
        weighted_com += segment.center() * segment.mass();
    }

    let com = weighted_com / total_mass;

    // Calculate inertia about origin
    let mut inertia_origin = Matrix3::zeros();
    for segment in &segments {
        inertia_origin += segment.inertia();
    }

    // Calculate inertia about center of mass using parallel axis theorem
    let mut inertia_com = inertia_origin;
    
    // Subtract the parallel axis contribution: I_com = I_origin - m * (r x r)
    let r = com;
    let r_cross = Matrix3::new(
        r.y * r.y + r.z * r.z, -r.x * r.y, -r.x * r.z,
        -r.x * r.y, r.x * r.x + r.z * r.z, -r.y * r.z,
        -r.x * r.z, -r.y * r.z, r.x * r.x + r.y * r.y,
    );
    inertia_com -= r_cross * total_mass;

    let output = InertiaOutput {
        mass: total_mass,
        center_of_mass: [com.x, com.y, com.z],
        inertia_origin: inertia_origin.into(),
        inertia_com: inertia_com.into(),
    };

    match args.output {
        OutputFormat::Json => {
            println!("{}", serde_json::to_string_pretty(&output)?);
        }
        OutputFormat::Urdf => {
            println!("<!-- URDF inertial properties for {} -->", args.file);
            println!("<inertial>");
            println!("  <mass value=\"{:.6}\"/>", output.mass / 1000.0); // Convert to kg
            println!(
                "  <origin xyz=\"{:.6} {:.6} {:.6}\" rpy=\"0 0 0\"/>",
                output.center_of_mass[0] / 1000.0, // Convert to meters
                output.center_of_mass[1] / 1000.0,
                output.center_of_mass[2] / 1000.0
            );
            // Convert g·mm² to kg·m²
            let scale = 1e-9;
            println!("  <inertia");
            println!("    ixx=\"{:.9}\" iyy=\"{:.9}\" izz=\"{:.9}\"",
                output.inertia_com.ixx * scale,
                output.inertia_com.iyy * scale,
                output.inertia_com.izz * scale
            );
            println!("    ixy=\"{:.9}\" ixz=\"{:.9}\" iyz=\"{:.9}\"/>",
                output.inertia_com.ixy * scale,
                output.inertia_com.ixz * scale,
                output.inertia_com.iyz * scale
            );
            println!("</inertial>");
        }
    }

    Ok(())
}