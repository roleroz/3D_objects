// Module to create a bracket that sits at 90 degrees against the Ikea Skadis pegboard
//
// You can set the length and distance to the wall of the tenon, as well as the height

use <lib/geometry/triangle/right_triangle.scad>
use <ikea_skadis/peg.scad>

$fn=50;

// Variables to set
height = 20;         // Height of the bracket against the pegboard wall 
tenon_length = 60;   // Length of the tenon (matches the mortise on the shelf)
tenon_distance = 11; // Distance from the tenon to the pegboard (matches the mortise on the shelf)

SkadisPeg();
translate([0, -SkadisPegWidth()/2, 0])
    rotate([-90, 0, 0])
        RightTrianglePrism([tenon_distance + tenon_length, height], SkadisPegWidth());
translate([tenon_distance, -SkadisPegWidth()/2, 0])
    cube([tenon_length, SkadisPegWidth(), 2]);
