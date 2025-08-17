// Module to create a truss based bracket at 45 degrees for an Ikea Skadis pegboard
//
// You can set the number of pegs, the tenon lenght and distance from the pegboard

use <lib/geometry/triangle/right_triangle.scad>
use <models/ikea_skadis/peg.scad>

$fn=50;

// Variables to set
num_pegs = 2;        // Number of pegs to use on the pegboard 
tenon_length = 90;   // Length of the tenon (matches the mortise on the shelf)
tenon_distance = 10; // Distance from the tenon to the pegboard (matches the mortise on the shelf)

module Truss(side, thickness) {
    inner_side = side - thickness*(2+sqrt(2));
    translate([0, thickness/2, -side]) rotate([90,0,0]) {
        intersection() {
            RightTrianglePrism([side, side], thickness);
            union() {
                difference() {
                    RightTrianglePrism([side, side], thickness);
                    translate([thickness, thickness, -1])
                        RightTrianglePrism([inner_side, inner_side], thickness+2);
                }
                for (i = [-1:1])
                    translate([0, i*inner_side/2, 0])
                        rotate([0, 0, 45])
                            translate([0, -thickness/2, 0])
                                cube([side, thickness,thickness]);
            }
        }
    }
}

full_length = tenon_length + tenon_distance;

SkadisMultiPeg(num_pegs);
Truss(full_length/sqrt(2), SkadisPegWidth());
translate([tenon_distance/sqrt(2), -SkadisPegWidth()/2, -tenon_distance/sqrt(2)])
    rotate([0, 45, 0])
        cube([tenon_length, SkadisPegWidth(), 2]);
