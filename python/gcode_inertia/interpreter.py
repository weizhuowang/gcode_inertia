"""G-code interpreter and parser.

Units:
  - length: mm
  - mass: g
  - inertia: g·mm²
"""

import re
import numpy as np
from typing import List, Dict, Optional, Union
from .segments import Segment, LineSeg, ArcSeg


class Extruder:
    """Track extruder position and handle absolute/relative modes."""

    def __init__(self):
        self.pos = 0.0  # Current E position
        self.max_pos = 0.0  # Highest E position reached
        self.relative = False  # False=M82 (absolute), True=M83 (relative)

    def consume(self, e_value: Optional[float]) -> float:
        """Process E value and return amount extruded."""
        if e_value is None:
            return 0.0

        if not self.relative:
            # Absolute mode: e_value is new position
            self.pos = e_value
            if e_value > self.max_pos:
                extruded = e_value - self.max_pos
                self.max_pos = e_value
                return extruded
            else:
                return 0.0
        else:
            # Relative mode: e_value is delta
            self.pos += e_value
            if self.pos > self.max_pos:
                extruded = self.pos - self.max_pos
                self.max_pos = self.pos
                return extruded
            else:
                return 0.0

    def reset(self, e: float):
        """Reset position (G92 E...)."""
        self.pos = e
        self.max_pos = e


class GCodeInterpreter:
    """Interprets G-code commands and generates segments."""

    def __init__(self, filament_diameter: float, filament_density: float):
        """
        Args:
            filament_diameter: Filament diameter in mm
            filament_density: Filament density in g/cm³
        """
        self.filament_diameter = filament_diameter
        self.filament_density = filament_density / 1000.0  # Convert to g/mm³
        self.pos = np.zeros(3)
        self.xyz_rel = False
        self.extruder = Extruder()

    def _parse_gcode_line(self, line: str) -> Optional[Dict[str, Union[str, float]]]:
        """Parse a single G-code line into command and parameters."""
        # Remove comments
        line = line.split(";")[0].strip()
        if not line:
            return None

        # Split into tokens
        tokens = line.split()
        if not tokens:
            return None

        # First token should be command
        cmd = tokens[0].upper()
        if not (cmd.startswith("G") or cmd.startswith("M")):
            return None

        result = {"cmd": cmd}

        # Parse parameters
        for token in tokens[1:]:
            if len(token) >= 2 and token[0].isalpha():
                letter = token[0].upper()
                try:
                    value = float(token[1:])
                    result[letter] = value
                except ValueError:
                    pass

        return result

    def _next_coord(
        self, current: float, value: Optional[float], relative: bool
    ) -> float:
        """Calculate next coordinate based on mode."""
        if value is None:
            return current
        return current + value if relative else value

    def process_command(
        self, cmd_dict: Dict[str, Union[str, float]]
    ) -> Optional[Segment]:
        """Process a parsed G-code command and return segment if applicable."""
        cmd = cmd_dict["cmd"]

        if cmd == "G90":
            self.xyz_rel = False
            return None
        elif cmd == "G91":
            self.xyz_rel = True
            return None
        elif cmd == "G92":
            # Reset coordinates
            if "X" in cmd_dict:
                self.pos[0] = cmd_dict["X"]
            if "Y" in cmd_dict:
                self.pos[1] = cmd_dict["Y"]
            if "Z" in cmd_dict:
                self.pos[2] = cmd_dict["Z"]
            if "E" in cmd_dict:
                self.extruder.reset(cmd_dict["E"])
            return None
        elif cmd == "M82":
            self.extruder.relative = False
            return None
        elif cmd == "M83":
            self.extruder.relative = True
            return None
        elif cmd in ["G0", "G1", "G2", "G3"]:
            return self._handle_motion(cmd, cmd_dict)

        return None

    def _handle_motion(
        self, cmd: str, params: Dict[str, Union[str, float]]
    ) -> Optional[Segment]:
        """Handle G0/G1/G2/G3 motion commands."""
        # Calculate target position
        target = np.array(
            [
                self._next_coord(self.pos[0], params.get("X"), self.xyz_rel),
                self._next_coord(self.pos[1], params.get("Y"), self.xyz_rel),
                self._next_coord(self.pos[2], params.get("Z"), self.xyz_rel),
            ]
        )

        # Calculate extrusion
        de = self.extruder.consume(params.get("E"))

        # Calculate mass from extrusion
        cross_section = np.pi * (self.filament_diameter**2) / 4.0
        mass = de * cross_section * self.filament_density

        segment = None

        if cmd in ["G0", "G1"] and de > 0:
            # Linear move with extrusion
            segment = LineSeg(self.pos.copy(), target, mass)

        elif cmd in ["G2", "G3"] and de > 0:
            # Arc move with extrusion
            # I, J are offsets from current position to arc center
            i = params.get("I", 0.0)
            j = params.get("J", 0.0)

            # Arc center
            center = np.array([self.pos[0] + i, self.pos[1] + j, self.pos[2]])

            # Calculate angles
            s_rel = self.pos - center
            e_rel = target - center

            θ0 = np.arctan2(s_rel[1], s_rel[0])
            θ1 = np.arctan2(e_rel[1], e_rel[0])

            # G2 is clockwise, G3 is counter-clockwise
            cw = cmd == "G2"
            dθ = θ0 - θ1 if cw else θ1 - θ0

            if dθ <= 0:
                dθ += 2 * np.pi

            if cw:
                dθ = -dθ

            radius = np.linalg.norm(s_rel[:2])
            segment = ArcSeg(center, radius, θ0, dθ, mass)

        # Update position
        self.pos = target

        return segment


def parse_segments(
    gcode_str: str, filament_diameter: float = 1.75, filament_density: float = 1.24
) -> List[Segment]:
    """Parse G-code string and return list of segments.

    Args:
        gcode_str: G-code as string
        filament_diameter: Filament diameter in mm (default: 1.75)
        filament_density: Filament density in g/cm³ (default: 1.24 for PLA)

    Returns:
        List of Segment objects
    """
    interpreter = GCodeInterpreter(filament_diameter, filament_density)
    segments = []

    for line in gcode_str.split("\n"):
        parsed = interpreter._parse_gcode_line(line)
        if parsed:
            segment = interpreter.process_command(parsed)
            if segment:
                segments.append(segment)

    return segments
