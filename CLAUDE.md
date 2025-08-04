# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Project Overview

G-code mass & inertia analyzer for 3D printed parts, providing physical properties for robotics applications. The project has both Rust and Python implementations with identical functionality.

## Architecture

- **lib/**: Core Rust physics library
  - `interpreter.rs`: G-code parser handling G0/G1/G2/G3 moves and extrusion
  - `segments.rs`: Geometric segment types (LineSeg, ArcSeg) with mass/inertia calculations
- **cli/**: Rust CLI tool outputting JSON or URDF format
- **web/**: Leptos-based web interface (WASM)
- **python/**: Pure Python implementation mirroring Rust functionality
  - Same module structure as Rust (interpreter.py, segments.py)
  - CLI with identical interface

## Common Commands

### Rust Development
```bash
# Run all tests
cargo test

# Build CLI tool
cargo build --release -p gcode_inertia_cli

# Run CLI tool
./target/release/gcode-inertia -f example_gcodes/test.gcode --output urdf

# Build and serve web interface
cd web && trunk serve
```

### Python Development
```bash
cd python

# Run tests
python -m pytest

# Install package
pip install -e .

# Run CLI
gcode-inertia-py -f ../example_gcodes/test.gcode --output urdf
```

## Key Implementation Details

- Units: mm (length), g (mass), g·mm² (inertia in JSON), auto-converted to SI units for URDF
- Coordinate system: 3D printer frame (origin at home position)
- Supports absolute (G90/M82) and relative (G91/M83) positioning modes
- Only processes moves with positive extrusion (ignores retractions)
- Arc segments (G2/G3) use I/J offsets for center calculation
- **v0.3.0 fixes**:
  - Z-coordinate of mass is at center of deposited layer (0.5 * layer_height below nozzle)
  - Bambu Lab slicers have a 2mm Y-axis offset that is automatically corrected

## Supported G-code Commands

The implementation handles only these 9 G-code commands:
- **G0** - Rapid move (only creates segment if extrusion > 0)
- **G1** - Linear move (only creates segment if extrusion > 0)
- **G2** - Clockwise arc (only creates segment if extrusion > 0)
- **G3** - Counter-clockwise arc (only creates segment if extrusion > 0)
- **G90** - Absolute XYZ positioning mode
- **G91** - Relative XYZ positioning mode
- **G92** - Set position (X/Y/Z/E)
- **M82** - Absolute extrusion mode
- **M83** - Relative extrusion mode

All other G-code commands are ignored. This includes temperature commands, fan control, tool changes, etc. The implementation is slicer-agnostic and works with any FDM G-code that uses standard extrusion moves.

## Testing Strategy

Both implementations have unit tests covering:
- Line and arc segment geometry
- Mass calculations from extrusion
- Inertia tensor computations
- G-code parsing edge cases (relative mode, retractions)

Test files available in `example_gcodes/`: `test.gcode`, `arc.gcode`, `bambu_test_*.gcode`

## Bambu Lab Specific Features (Python v0.3.0+)

- Automatic detection via "BambuStudio" string in header
- Filters calibration/purge lines before first `OBJECT_ID` marker
- Single object enforcement (errors if multiple `OBJECT_ID` values found)
- 2mm Y-axis coordinate correction applied to final center of mass
- Dynamic layer height detection for accurate Z calculations