use <lib/geometry/composed/cube_with_bottom_cylinder.scad>

// Constants
peg_width = 4.5;
peg_height = 6;
hook_height = 10;
pegboard_thickness = 5.7;
peg_back_thickness = 2;
pegboard_hole_distance = 40;

// Single peg for an Ikea Skadis pegboard
//
// Origin is at the top of the peg vertically, the middle of the peg horizontally, and it grows
// towards -X, so assume that the YZ plane is your pegboard and you need to build on positive X
module SkadisPeg() {
    translate([-pegboard_thickness, 0, 0])
        CubeWithBottomCylinder(size=[pegboard_thickness, peg_width, peg_height]);
    translate([-pegboard_thickness - peg_back_thickness, 0, 0])
        CubeWithBottomCylinder(size=[peg_back_thickness, peg_width, hook_height]);
}

// Multiple pegs for an Ikea Skadis pegboard arranged vertically
//
// Origin for these is the origin of the top peg
//
// Args:
// - count (int > 0): Number of pegs that you want arranged vertically
module SkadisMultiPeg(count) {
    assert(is_num(count), "Count must be a positive integer");
    assert(count > 0, "Count must be a positive integer");
    assert(count % 1 == 0, "Count must be a positive integer");
    for (i = [0:count-1])
        translate([0, 0, -i * pegboard_hole_distance])
            SkadisPeg();
}

// Width of a Skadis peg, to be used in models that use these pegs
function SkadisPegWidth() = peg_width;

// Vertical separation of Skadis pegs, to be used in models that use these pegs
function SkadisPegVerticalSeparation() = pegboard_hole_distance;

// Horizontal separation of Skadis pegs, to be used in models that use these pegs
function SkadisPegHorizontalSeparation() = pegboard_hole_distance;
