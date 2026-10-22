# Swastya Setu — project files for GitHub

This package contains only files relevant to the current prototype concept, plus previews so the design can be viewed without installing CAD software.

## Included
- `mechanical/SwastyaSetu_IoT_Enclosure.scad` — editable OpenSCAD source for the concept enclosure.
- `mechanical/SwastyaSetu_Enclosure_Tray.step` and `..._Lid.step` — STEP exchange models. STEP import geometry was checked for one solid per file; dimensions are approximately 160 x 134 x 38 mm (tray) and 160 x 112 x 7 mm (lid).
- `mechanical/*.stl` — mesh models; easiest to preview in Windows 3D Viewer, Blender, or slicer software.
- `electronics/SwastyaSetu_System_Block_Schematic.kicad_sch` — KiCad-format graphical system/block draft based on the available pin map. It is not an ERC-verified pin-level schematic.
- `simulation/SwastyaSetu_AccidentAlert_Simulation.m` — illustrative MATLAB/Octave-compatible synthetic sensor and alert logic simulation.
- `firmware/SwastyaSetu_ESP32_Firmware_Provided.txt` — copy of the firmware text supplied by the project owner, retained as a reference.
- `preview/` — PNG previews for viewing without CAD tools.
- `SwastyaSetu_Project_Preview_and_Open_Guide.pdf` — visual guide and how-to-open instructions.

## What is not included
- `.SLDPRT`: a genuine SolidWorks native part cannot be responsibly generated/verified here. Import the STEP in SolidWorks and save as `.SLDPRT` if you have SolidWorks. It will be an imported solid, not a feature-history model.
- No claim of vehicle validation, electrical-rule-check pass, or safety certification.

## Open files
- **To see it immediately:** open the PDF or PNGs in `preview/`.
- **To edit enclosure:** install OpenSCAD (free), open the `.scad`, select `part = \"tray\"`, `\"lid\"`, or `\"assembly\"`, then press F5 for preview or F6 to render.
- **To view STEP:** use FreeCAD (free) or import it into SolidWorks.
- **To view STL:** open with Windows 3D Viewer, Blender, or a 3D-print slicer.
- **To open schematic:** install KiCad and open the `.kicad_sch`. The current file is a system-level graphical draft; exact wiring and power must be verified before use.
- **To run MATLAB:** open the `.m` file in MATLAB and run `SwastyaSetu_AccidentAlert_Simulation`. Octave may also run it; plotting functions may differ by version.

## Safety / verification notes
1. Measure actual boards, connectors, battery holder and antenna cable before fabricating the enclosure.
2. Do not attach to, drill into, or connect to airbag/SRS components or wiring. Vehicle mounting needs a qualified safety review.
3. Confirm battery chemistry/protection, buck output, SIM800L supply and peak-current needs, common ground, and logic-level compatibility.
4. Firmware GPS variables `lastLat` and `lastLon` are not updated in the provided code; fix before relying on transmitted location.
5. Simulation thresholds are illustrative only and must not be represented as validated accident-detection performance.
