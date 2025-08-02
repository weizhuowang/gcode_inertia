# G-Code Inertia Python Package (gcode-inertia-py)

Pure Python implementation of the G-code mass and inertia calculator. This is the Python version of the gcode_inertia project.

## Installation

```bash
# From the python directory
pip install -e .

# Or install from parent directory
pip install -e ./python
```

## Usage

### Command Line

```bash
# Basic usage
gcode-inertia-py -f part.gcode

# With custom filament properties
gcode-inertia-py -f part.gcode --diameter 1.75 --density 1.25

# Output URDF format
gcode-inertia-py -f part.gcode --output urdf
```

### Python API

```python
import numpy as np
from gcode_inertia import parse_segments

# Parse G-code
segments = parse_segments(gcode_string, filament_diameter=1.75, filament_density=1.25)

# Calculate properties
total_mass = sum(seg.mass() for seg in segments)

# Center of mass
weighted_com = sum(seg.center() * seg.mass() for seg in segments)
com = weighted_com / total_mass

# Inertia tensor
inertia = sum(seg.inertia() for seg in segments)
```

## Testing

```bash
# Run tests with pytest
pytest tests/
```

## Coordinate System

Same as the Rust version - all calculations are in the 3D printer's coordinate frame. See main README for details on coordinate transformations.