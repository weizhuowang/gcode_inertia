# G-Code Mass & Inertia Analyzer

A Python (originally Rust) library and tools for calculating mass, center of mass, and inertia tensors from G-code files. Perfect for robotics applications where you need accurate physical properties of 3D printed parts for URDF files.

Based on the original [PrintDynamic](https://github.com/gmmyung/printdynamic) project by [@gmmyung](https://github.com/gmmyung). This fork:
- Reorganizes the codebase
- Fixed various bugs in inertia calculation, supports bambulab gcode with extra features
- Adds a CLI tool with URDF output
- Provides better documentation for robotics applications

## 🆕 What's New in v0.3.1 (Python)

- **Fixed Z-axis COM Bug**: Center of mass Z-coordinate now correctly calculated at center of deposited material layer (not nozzle position)
- **Bambu Lab Y-axis Correction**: Added automatic 2mm Y-axis offset correction for Bambu Lab slicer coordinate system
- **Layer Height Detection**: Dynamically detects actual layer height from G-code for accurate Z calculations

### Previous: v0.2.0
- **Bambu Lab G-code Support**: Automatically detects and handles Bambu Lab slicer files
- **Calibration Filtering**: Excludes purge/calibration lines for more accurate mass calculations
- **Multi-Object Detection**: Warns when multiple objects are detected (single object only)
- **Updated PLA Density**: Now uses standard 1.24 g/cm³ as default

## Features

- **Accurate Physics Calculations** - Computes mass, center of mass, and full inertia tensors
- **G-code Parsing** - Handles standard FDM printer G-code with extrusion
- **Bambu Lab Support** (Python v0.3.1+) - Special handling for Bambu Lab slicer G-codes:
  - Automatic detection and color-coded status
  - Multi-object detection with single-object enforcement
  - Calibration line filtering to exclude purge material
  - Automatic 2mm Y-axis coordinate correction
- **Multiple Implementations**:
  - **Rust**: Fast native library, CLI (`gcode-inertia`), and web interface
  - **Python**: Easy-to-use package (`gcode-inertia-py`) with enhanced features

## Project Structure

```
gcode_inertia/
├── lib/          # Core Rust physics library
├── cli/          # Rust CLI tool (gcode-inertia)
├── web/          # Web interface (Leptos/WASM)
└── python/       # Python implementation (gcode-inertia-py)
```

## Setup & Installation

### Choose Your Implementation

#### Rust Version (gcode-inertia)
- **Pros**: Fast, native performance, includes web interface
- **Cons**: Requires Rust toolchain
- **Best for**: Performance-critical applications, web deployment

#### Python Version (gcode-inertia-py)
- **Pros**: Easy pip install, integrates with Python robotics tools, enhanced Bambu Lab support
- **Cons**: Slower than Rust version
- **Best for**: Python workflows, quick scripts, robotics integration, Bambu Lab users

### Rust Installation

Prerequisites: [Rust](https://rustup.rs/) (latest stable version)

#### CLI Tool Installation

```bash
# Clone the repository
git clone https://github.com/yourusername/gcode_inertia.git
cd gcode_inertia

# Install the CLI tool globally
cargo install --path cli

# Or build and run directly
cargo build --release -p gcode_inertia_cli
./target/release/gcode-inertia --help
```

#### Web Interface Setup

```bash
# Install trunk if you haven't already
cargo install trunk

# Navigate to web directory
cd web

# Start the development server
trunk serve

# Open http://localhost:8080 in your browser
```

### Python Installation

```bash
# Clone the repository
git clone https://github.com/yourusername/gcode_inertia.git
cd gcode_inertia/python

# Install the package
pip install -e .

# Or install directly from the python directory
pip install gcode-inertia-py
```

## Usage

### CLI Tools

Both versions provide identical CLI interfaces:

#### Rust CLI (gcode-inertia)
```bash
# Basic usage (outputs JSON)
gcode-inertia -f part.gcode

# Output URDF format
gcode-inertia -f part.gcode --output urdf
```

#### Python CLI (gcode-inertia-py)
```bash
# Basic usage (outputs JSON)
gcode-inertia-py -f part.gcode

# Output URDF format
gcode-inertia-py -f part.gcode --output urdf
```

Common options for both:
- `--diameter`: Filament diameter in mm (default: 1.75)
- `--density`: Filament density in g/cm³ (default: 1.24)

### Example Output (JSON)

```json
{
  "mass": 45.632,
  "center_of_mass": [25.431, 18.234, 12.543],
  "inertia_origin": { ... },
  "inertia_com": {
    "ixx": 1234.567,
    "iyy": 1567.890,
    "izz": 2134.567,
    "ixy": 234.567,
    "ixz": 123.456,
    "iyz": 345.678
  }
}
```

### Example Output (URDF)

```xml
<inertial>
  <mass value="0.045632"/>
  <origin xyz="0.025431 0.018234 0.012543" rpy="0 0 0"/>
  <inertia
    ixx="0.000001234" iyy="0.000001567" izz="0.000002134"
    ixy="0.000000234" ixz="0.000000123" iyz="0.000000345"/>
</inertial>
```

## Important: Coordinate System

⚠️ **All calculations use the 3D printer's coordinate frame!**

### Printer Coordinate System
- **Origin**: Printer's home position (typically front-left corner of bed, Z=0)
- **X-axis**: Left to right across the print bed
- **Y-axis**: Front to back on the print bed
- **Z-axis**: Vertical (bed to nozzle)

### Implications for Robotics/URDF

Both position AND orientation matter! You need to:

1. **Transform the center of mass** to your part's local coordinate system
2. **Rotate the inertia tensor** if your part's orientation differs from print orientation

### Example: Complete Transform

If you printed a link standing up (along Z-axis) but mount it horizontally (along X-axis):

```python
import numpy as np

# From tool output (part printed standing up along Z)
com_printer = [125.5, 118.3, 45.2]  # In printer coordinates
inertia_com = np.array([
    [1234.5, 12.3,   13.4],
    [12.3,   1567.8, 23.5],
    [13.4,   23.5,   234.5]
])  # In printer orientation

# Step 1: Transform COM position
# If part origin is at (100, 100, 0) on print bed
com_local = np.array([25.5, 18.3, 45.2])

# Step 2: Rotate inertia tensor
# Rotation from printed orientation (Z-up) to mounted orientation (X-forward)
# This is a 90° rotation about Y-axis
R = np.array([
    [0,  0, 1],  # Z -> X
    [0,  1, 0],  # Y -> Y  
    [-1, 0, 0]   # X -> -Z
])

# Apply rotation: I' = R * I * R^T
inertia_rotated = R @ inertia_com @ R.T

# Result: inertia tensor in part's mounted orientation
```

### Common Rotation Matrices

- **90° about X**: Part printed flat, used standing
- **90° about Y**: Part printed standing, used lengthwise
- **180° about Z**: Part printed backwards

## Library Usage

```rust
use gcode_inertia::interpreter::parse_segments;
use gcode_inertia::segments::Segment;

let gcode = std::fs::read_to_string("part.gcode")?;
let segments = parse_segments(&gcode, 1.75, 1.24);

let total_mass: f32 = segments.iter().map(|s| s.mass()).sum();
// ... calculate COM and inertia ...
```

## Python Integration

For Python users, call the CLI tool using subprocess:

```python
import subprocess
import json

result = subprocess.run(
    ['gcode-inertia', '-f', 'part.gcode', '--output', 'json'],
    capture_output=True,
    text=True
)
data = json.loads(result.stdout)

# For URDF generation
result_urdf = subprocess.run(
    ['gcode-inertia', '-f', 'part.gcode', '--output', 'urdf'],
    capture_output=True,
    text=True
)
print(result_urdf.stdout)  # Ready to paste into URDF
```

## Units

### Input
- G-code positions: millimeters (mm)
- Filament diameter: millimeters (mm)
- Filament density: grams per cubic centimeter (g/cm³)

### Output
- **JSON format**:
  - Mass: grams (g)
  - Center of mass: millimeters (mm)
  - Inertia: gram·square millimeters (g·mm²)
- **URDF format** (automatically converted):
  - Mass: kilograms (kg)
  - Center of mass: meters (m)
  - Inertia: kilogram·square meters (kg·m²)

## Common Filament Densities

- PLA: 1.24 g/cm³
- ABS: 1.04 g/cm³
- PETG: 1.27 g/cm³
- TPU: 1.21 g/cm³
- Nylon: 1.15 g/cm³

## Troubleshooting

### "No extrusion segments found"
- Check that your G-code contains extrusion moves (E values)
- Ensure the file is sliced for FDM printing, not CNC milling

### Web interface won't load
- Make sure you're running `trunk serve` from the `web/` directory
- Check that port 8080 is available

### Wrong inertia values
- Verify filament diameter matches your printer settings
- Check density value for your specific filament brand
- Remember values are in printer coordinates, not part coordinates

## License

MIT