"""Tests for G-code interpreter."""

import numpy as np
import pytest
from gcode_inertia.interpreter import parse_segments


class TestInterpreter:
    def test_parse_single_line(self):
        """Test parsing single line segment."""
        gcode = "G90\nG1 X10.0 Y20.0 E5.0"
        segments = parse_segments(gcode, 1.75, 1.25)
        
        assert len(segments) == 1
        seg = segments[0]
        
        # Check center (midpoint of (0,0,0) to (10,20,0))
        center = seg.center()
        np.testing.assert_almost_equal(center, [5.0, 10.0, 0.0])
        
        # Check mass calculation
        expected_mass = 5.0 * np.pi * 1.75**2 / 4.0 * (1.25 / 1000.0)
        assert abs(seg.mass() - expected_mass) < 1e-5
    
    def test_relative_extrusion(self):
        """Test relative extrusion mode."""
        gcode = "M83\nG1 X1 Y0 E2.0\nG1 X2 Y0 E3.0"
        segments = parse_segments(gcode, 1.75, 1.25)
        
        assert len(segments) == 2
        
        # Check masses
        density = 1.25 / 1000.0
        area = np.pi * 1.75**2 / 4.0
        
        assert abs(segments[0].mass() - 2.0 * area * density) < 1e-5
        assert abs(segments[1].mass() - 3.0 * area * density) < 1e-5
    
    def test_no_extrusion_no_segment(self):
        """Test that moves without extrusion produce no segments."""
        gcode = "G1 X5 Y5"
        segments = parse_segments(gcode, 1.75, 1.25)
        assert len(segments) == 0
    
    def test_arc_segment(self):
        """Test arc segment parsing."""
        # Move to (10,0), then CCW quarter circle to (0,10) with center at origin
        gcode = "G90\nG1 X10 Y0 E1.0\nG3 X0 Y10 I-10 J0 E2.0"
        segments = parse_segments(gcode, 1.75, 1.25)
        
        assert len(segments) == 2
        # First is line, second is arc
        arc = segments[1]
        
        # Arc center of mass should be offset from origin
        center = arc.center()
        assert center[0] > 0  # Should be positive due to quarter circle shape
        assert center[1] > 0