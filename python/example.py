"""Example usage of gcode_inertia library."""

import numpy as np
from gcode_inertia import parse_segments


def main():
    # Sample G-code
    gcode = """
    G90 ; Absolute positioning
    G1 X0 Y0 Z0 F3000 ; Move to origin
    G1 X50 Y0 E2.0 ; Extrude 2mm of filament
    G1 X50 Y50 E2.0 ; Another 2mm
    G1 X0 Y50 E2.0 ; Another 2mm
    G1 X0 Y0 E2.0 ; Complete square
    """
    
    # Parse with standard PLA settings
    segments = parse_segments(gcode, filament_diameter=1.75, filament_density=1.25)
    
    print(f"Found {len(segments)} segments")
    
    # Calculate total mass
    total_mass = sum(seg.mass() for seg in segments)
    print(f"Total mass: {total_mass:.3f} g")
    
    # Calculate center of mass
    weighted_com = np.zeros(3)
    for seg in segments:
        weighted_com += seg.center() * seg.mass()
    com = weighted_com / total_mass
    print(f"Center of mass: [{com[0]:.3f}, {com[1]:.3f}, {com[2]:.3f}] mm")
    
    # Calculate inertia about origin
    inertia_origin = np.zeros((3, 3))
    for seg in segments:
        inertia_origin += seg.inertia()
    
    print(f"\nInertia about origin (g·mm²):")
    print(f"Ixx={inertia_origin[0,0]:.3f}, Iyy={inertia_origin[1,1]:.3f}, Izz={inertia_origin[2,2]:.3f}")
    
    # Calculate inertia about COM
    r = com
    r_cross = np.array([
        [r[1]**2 + r[2]**2, -r[0]*r[1], -r[0]*r[2]],
        [-r[0]*r[1], r[0]**2 + r[2]**2, -r[1]*r[2]],
        [-r[0]*r[2], -r[1]*r[2], r[0]**2 + r[1]**2]
    ])
    inertia_com = inertia_origin - total_mass * r_cross
    
    print(f"\nInertia about COM (g·mm²):")
    print(f"Ixx={inertia_com[0,0]:.3f}, Iyy={inertia_com[1,1]:.3f}, Izz={inertia_com[2,2]:.3f}")


if __name__ == '__main__':
    main()