"""Segment abstraction and concrete Line/Arc implementations."""

import numpy as np
from abc import ABC, abstractmethod
from typing import Tuple


class Segment(ABC):
    """Abstract base class for printable segments."""
    
    @abstractmethod
    def center(self) -> np.ndarray:
        """Return center of mass [x, y, z]."""
        pass
    
    @abstractmethod
    def inertia(self) -> np.ndarray:
        """Return 3x3 inertia tensor about origin."""
        pass
    
    @abstractmethod
    def mass(self) -> float:
        """Return mass in grams."""
        pass


class LineSeg(Segment):
    """Line segment with uniform mass distribution."""
    
    def __init__(self, start: np.ndarray, end: np.ndarray, mass: float):
        self.start = np.array(start)
        self.end = np.array(end)
        self._mass = mass
    
    def center(self) -> np.ndarray:
        """Center of mass is at midpoint."""
        return (self.start + self.end) * 0.5
    
    def mass(self) -> float:
        return self._mass
    
    def inertia(self) -> np.ndarray:
        """Inertia tensor for a thin rod about origin."""
        m = self._mass
        r0 = self.start
        u = self.end - self.start
        
        # Outer product helper
        def outer(a, b):
            return np.outer(a, b)
        
        # Scalar terms
        c = np.dot(r0, r0) + np.dot(r0, u) + np.dot(u, u) / 3.0
        
        # Matrix terms
        q = outer(r0, r0) + outer(r0, u) * 0.5 + outer(u, r0) * 0.5 + outer(u, u) / 3.0
        
        # I = m * (c * I - q)
        return np.eye(3) * (m * c) - q * m


class ArcSeg(Segment):
    """Arc segment with uniform mass distribution."""
    
    def __init__(self, center: np.ndarray, radius: float, start_ang: float, 
                 delta_ang: float, mass: float):
        self.arc_center = np.array(center)  # Center of the arc
        self.radius = radius
        self.start_ang = start_ang
        self.delta_ang = delta_ang
        self._mass = mass
    
    def center(self) -> np.ndarray:
        """Center of mass of circular arc."""
        θ0 = self.start_ang
        θ1 = θ0 + self.delta_ang
        dθ = self.delta_ang
        
        # Integrals of cos and sin
        c_int = np.sin(θ1) - np.sin(θ0)
        s_int = -np.cos(θ1) + np.cos(θ0)
        
        return np.array([
            self.arc_center[0] + self.radius * c_int / dθ,
            self.arc_center[1] + self.radius * s_int / dθ,
            self.arc_center[2]
        ])
    
    def mass(self) -> float:
        return self._mass
    
    def inertia(self) -> np.ndarray:
        """Inertia tensor for circular arc about origin."""
        θ0 = self.start_ang
        dθ = self.delta_ang
        θ1 = θ0 + dθ
        
        # Linear mass density
        λ = self._mass / (self.radius * dθ)
        
        # Trig integrals
        s20, s21 = np.sin(2 * θ0), np.sin(2 * θ1)
        c20, c21 = np.cos(2 * θ0), np.cos(2 * θ1)
        
        ic2 = 0.5 * dθ + 0.25 * (s21 - s20)  # ∫cos²
        is2 = 0.5 * dθ - 0.25 * (s21 - s20)  # ∫sin²
        ic = np.sin(θ1) - np.sin(θ0)         # ∫cos
        is_ = -np.cos(θ1) + np.cos(θ0)       # ∫sin
        ics = -0.25 * (c21 - c20)             # ∫cos·sin
        
        cx, cy, cz = self.arc_center
        r = self.radius
        
        # Diagonal terms
        a = cx * cx * dθ + 2 * cx * r * ic + r * r * ic2
        b = cy * cy * dθ + 2 * cy * r * is_ + r * r * is2
        c = cz * cz * dθ
        
        # Off-diagonal terms
        ab = cx * cy * dθ + cx * r * is_ + cy * r * ic + r * r * ics
        ac = cx * cz * dθ + r * cz * ic
        bc = cy * cz * dθ + r * cz * is_
        
        # Build Q matrix
        q = np.array([
            [a, ab, ac],
            [ab, b, bc],
            [ac, bc, c]
        ])
        
        sum_r2 = a + b + c
        return np.eye(3) * (λ * r * sum_r2) - q * (λ * r)