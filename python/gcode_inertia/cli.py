"""Command-line interface for gcode-inertia."""

import sys
import json
import argparse
import numpy as np
from typing import List
from .interpreter import parse_segments
from .segments import Segment


def calculate_properties(segments: List[Segment]) -> dict:
    """Calculate mass properties from segments."""
    if not segments:
        return {
            'mass': 0.0,
            'center_of_mass': [0.0, 0.0, 0.0],
            'inertia_origin': [[0.0] * 3 for _ in range(3)],
            'inertia_com': [[0.0] * 3 for _ in range(3)]
        }
    
    # Total mass
    total_mass = sum(seg.mass() for seg in segments)
    
    # Center of mass
    weighted_com = np.zeros(3)
    for seg in segments:
        weighted_com += seg.center() * seg.mass()
    com = weighted_com / total_mass
    
    # Inertia about origin
    inertia_origin = np.zeros((3, 3))
    for seg in segments:
        inertia_origin += seg.inertia()
    
    # Inertia about center of mass using parallel axis theorem
    # I_com = I_origin - m * (r × r)
    r = com
    r_cross = np.array([
        [r[1]**2 + r[2]**2, -r[0]*r[1], -r[0]*r[2]],
        [-r[0]*r[1], r[0]**2 + r[2]**2, -r[1]*r[2]],
        [-r[0]*r[2], -r[1]*r[2], r[0]**2 + r[1]**2]
    ])
    inertia_com = inertia_origin - total_mass * r_cross
    
    return {
        'mass': float(total_mass),
        'center_of_mass': com.tolist(),
        'inertia_origin': {
            'ixx': float(inertia_origin[0, 0]),
            'iyy': float(inertia_origin[1, 1]),
            'izz': float(inertia_origin[2, 2]),
            'ixy': float(inertia_origin[0, 1]),
            'ixz': float(inertia_origin[0, 2]),
            'iyz': float(inertia_origin[1, 2])
        },
        'inertia_com': {
            'ixx': float(inertia_com[0, 0]),
            'iyy': float(inertia_com[1, 1]),
            'izz': float(inertia_com[2, 2]),
            'ixy': float(inertia_com[0, 1]),
            'ixz': float(inertia_com[0, 2]),
            'iyz': float(inertia_com[1, 2])
        }
    }


def format_urdf(properties: dict, filename: str) -> str:
    """Format properties as URDF XML."""
    # Convert units for URDF
    mass_kg = properties['mass'] / 1000.0
    com_m = [v / 1000.0 for v in properties['center_of_mass']]
    
    # Convert g·mm² to kg·m²
    scale = 1e-9
    inertia = properties['inertia_com']
    
    return f"""<!-- URDF inertial properties for {filename} -->
<inertial>
  <mass value="{mass_kg:.6f}"/>
  <origin xyz="{com_m[0]:.6f} {com_m[1]:.6f} {com_m[2]:.6f}" rpy="0 0 0"/>
  <inertia
    ixx="{inertia['ixx'] * scale:.9f}" iyy="{inertia['iyy'] * scale:.9f}" izz="{inertia['izz'] * scale:.9f}"
    ixy="{inertia['ixy'] * scale:.9f}" ixz="{inertia['ixz'] * scale:.9f}" iyz="{inertia['iyz'] * scale:.9f}"/>
</inertial>"""


def main():
    """Main CLI entry point."""
    parser = argparse.ArgumentParser(
        prog='gcode-inertia-py',
        description='Calculate mass and inertia properties from G-code files (Python version)',
        epilog="""
COORDINATE SYSTEM WARNING:
All values are calculated in the 3D printer's coordinate frame!
- Origin: Printer home position (typically front-left corner at Z=0)
- X: Left to right on print bed
- Y: Front to back on print bed  
- Z: Vertical (bed to nozzle)

For URDF/robotics applications you MUST:
1. Transform the center of mass to your part's local coordinate frame
2. Rotate the inertia tensor if part orientation differs from print orientation
        """,
        formatter_class=argparse.RawDescriptionHelpFormatter
    )
    
    parser.add_argument('-f', '--file', required=True,
                        help='Path to the G-code file')
    parser.add_argument('-d', '--diameter', type=float, default=1.75,
                        help='Filament diameter in mm (default: 1.75)')
    parser.add_argument('-D', '--density', type=float, default=1.25,
                        help='Filament density in g/cm³ (default: 1.25 for PLA)')
    parser.add_argument('-o', '--output', choices=['json', 'urdf'], default='json',
                        help='Output format (default: json)')
    
    args = parser.parse_args()
    
    # Read G-code file
    try:
        with open(args.file, 'r') as f:
            gcode_content = f.read()
    except FileNotFoundError:
        print(f"Error: File '{args.file}' not found", file=sys.stderr)
        sys.exit(1)
    except Exception as e:
        print(f"Error reading file: {e}", file=sys.stderr)
        sys.exit(1)
    
    # Parse segments
    segments = parse_segments(gcode_content, args.diameter, args.density)
    
    if not segments:
        print("Warning: No extrusion segments found in G-code", file=sys.stderr)
        sys.exit(0)
    
    # Calculate properties
    properties = calculate_properties(segments)
    
    # Output results
    if args.output == 'json':
        print(json.dumps(properties, indent=2))
    else:  # urdf
        print(format_urdf(properties, args.file))


if __name__ == '__main__':
    main()