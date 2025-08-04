# Example G-code Files

This directory contains example G-code files for testing the gcode_inertia tool.

## Test Files

### Basic Test Files
- `test.gcode` - Basic test file with linear moves (G0/G1)
- `arc.gcode` - Test file containing arc moves (G2/G3)

### Bambu Lab Test Files
These files were generated using Bambu Studio slicer and demonstrate the tool's Bambu Lab specific features:

- `bambu_test_1part.gcode` - Single part test file
- `bambu_test_1part_sym.gcode` - Symmetric single part at Y=128mm
- `bambu_test_1part_sym_30.gcode` - Symmetric single part at Y=30mm
- `bambu_test_1part_sym_100.gcode` - Symmetric single part at Y=100mm
- `bambu_test_2part.gcode` - Two-part test file (will trigger multi-object error)

## Testing Commands

### Basic Usage
```bash
# From the python directory
gcode-inertia-py -f ../example_gcodes/test.gcode

# Test arc handling
gcode-inertia-py -f ../example_gcodes/arc.gcode

# Test Bambu Lab features
gcode-inertia-py -f ../example_gcodes/bambu_test_1part_sym_30.gcode
```

### Testing Multi-Object Detection (Should Error)
```bash
# This should produce an error about multiple objects
gcode-inertia-py -f ../example_gcodes/bambu_test_2part.gcode
```

## Expected Results

### bambu_test_1part_sym_30.gcode
With default settings (1.75mm diameter, 1.25 g/cm³ density):
- Mass: ~1.186g
- Center of Mass: [128.0, 30.0, 1.5] mm
- Bambu Lab features activated (calibration filtering, Y-axis correction)

### bambu_test_1part_sym_100.gcode
With default settings:
- Mass: ~1.186g
- Center of Mass: [128.0, 100.0, 1.5] mm
- Same features as above but at different Y position