"""G-Code Mass & Inertia Analyzer

Calculate mass, center of mass, and inertia tensors from G-code files.
Based on the PrintDynamic project by gmmyung.
"""

from .segments import Segment, LineSeg, ArcSeg
from .interpreter import GCodeInterpreter, parse_segments

__version__ = "0.1.0"
__all__ = ["Segment", "LineSeg", "ArcSeg", "GCodeInterpreter", "parse_segments"]