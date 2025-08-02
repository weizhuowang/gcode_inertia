"""Tests for segment classes."""

import numpy as np
import pytest
from gcode_inertia.segments import LineSeg, ArcSeg


class TestLineSeg:
    def test_center_mass_inertia(self):
        """Test line segment center, mass, and inertia."""
        start = np.array([0.0, 0.0, 0.0])
        end = np.array([1.0, 0.0, 0.0])
        mass = 2.0
        seg = LineSeg(start, end, mass)
        
        assert seg.mass() == mass
        
        # Center at midpoint
        center = seg.center()
        np.testing.assert_almost_equal(center, [0.5, 0.0, 0.0])
        
        # Inertia for rod along x-axis
        inertia = seg.inertia()
        np.testing.assert_almost_equal(inertia[0, 0], 0.0)
        np.testing.assert_almost_equal(inertia[1, 1], 2.0 / 3.0)
        np.testing.assert_almost_equal(inertia[2, 2], 2.0 / 3.0)
        
        # Check symmetry
        np.testing.assert_almost_equal(inertia, inertia.T)


class TestArcSeg:
    def test_full_circle(self):
        """Test full circle arc."""
        center = np.array([0.0, 0.0, 0.0])
        radius = 1.0
        start_ang = 0.0
        delta_ang = 2 * np.pi
        mass = 4.2
        
        seg = ArcSeg(center, radius, start_ang, delta_ang, mass)
        
        assert seg.mass() == mass
        
        # Center remains at origin for full circle
        com = seg.center()
        np.testing.assert_almost_equal(com, [0.0, 0.0, 0.0])
        
        # Inertia for thin ring
        inertia = seg.inertia()
        np.testing.assert_almost_equal(inertia[0, 0], mass * 0.5)
        np.testing.assert_almost_equal(inertia[1, 1], mass * 0.5)
        np.testing.assert_almost_equal(inertia[2, 2], mass)
        
    def test_semicircle(self):
        """Test semicircle arc."""
        center = np.array([1.0, 2.0, 3.0])
        radius = 2.0
        start_ang = 0.0
        delta_ang = np.pi
        mass = 6.0
        
        seg = ArcSeg(center, radius, start_ang, delta_ang, mass)
        
        # Expected center: original + [0, 2*radius/pi, 0]
        expected = np.array([1.0, 2.0 + (2.0 * radius) / np.pi, 3.0])
        np.testing.assert_almost_equal(seg.center(), expected)