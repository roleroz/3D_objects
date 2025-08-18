// Support for attaching PCBs to aluminum extrusion. This allows the PCBs being electrically
// isolated from the extrusion
//
// There are 2 holes to attach the PCB to the extrusion, and a dugout on the support so that through
// hole components (like connectors) have a place for their leads to go
//
// You can set:
// - Size of the extrusion
// - Distance between the screw holes (on center) on the PCB
// - Screw size diameter
// - Length of the board
// - Size of the dugout for through hole components' leads
// - Roundover radius
// - Extra length over what the board has, per side
// - Extra depth over what the dugout provides, so there's a bottom to the dugout

use <3D_printer_mods/extrusion_info.scad>
use <lib/geometry/cube/rounded_cube.scad>

$fn=50;

// Parameters
// Information about the extrusion
extrusion_size = 15;
// Information about the board
distance_between_holes = 30.226;
screw_hole_diameter = 3.5;
board_length = 38.1;
dugout = [21, 10, 1.6]; // For the 3 pin 3 way split
// Aesthetics
roundover_radius = 0.5;
oversize_length = 1;
extra_depth = 0.6;

// Computed values
assert(len(search(extrusion_size, [15, 20])) , "Invalid extrusion size, accepted values are 15 and 20");

body_size = [
    board_length + 2 * oversize_length,
    extrusion_size,
    dugout[2] + extra_depth];

extrusion_slit = [
    body_size[0],
    ExtrusionChannelWidth(extrusion_size),
    ExtrusionChannelDepth(extrusion_size)];

difference() {
    // Create the basic structure (top and extrusion peg)
    union() {
        RoundedCube(size=body_size, r=roundover_radius, rounded_top=false);
        translate([0, (body_size[1] - extrusion_slit[1]) / 2, body_size[2]])
            cube(extrusion_slit);
    }
    // Dig the dugout
    translate([(body_size[0] - dugout[0]) / 2, (body_size[1] - dugout[1]) / 2, -1])
        cube(dugout + [0,0,1]);
    // Dig the screw holes
    for (i = [0:1]) {
        translate([
            (body_size[0] - distance_between_holes) / 2 + i * distance_between_holes,
            body_size[1] / 2,
            -1])
            cylinder(d = screw_hole_diameter, h = body_size[2] + extrusion_slit[2] + 2);
    } 
}
