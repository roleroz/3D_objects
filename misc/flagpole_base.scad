// Model for a flagpole base. It uses PVC pipe for legs and flagpole holder

use <lib/geometry/composed/cube_with_bottom_cylinder.scad>
use <lib/geometry/triangle/right_triangle.scad>

$fn=50;

// Variables
leg_diameter = 32;
leg_hole_depth = 70;
min_thickness = 3;
vertical_diameter = 32;
vertical_height = 150;
connection_plate_thickness = 10;
cap_hole_length = 25;
render_center = true; // Set to true to render the center hub, or false to render end cap

module LegSupport(leg_diameter, leg_hole_depth, min_thickness, vertical_diameter, vertical_height) {
    width = leg_diameter + 2 * min_thickness;
    translate([vertical_diameter/2 + min_thickness, -width/2, 0]) {
        difference() {
            cube([leg_hole_depth + min_thickness, width, width]);
            translate([min_thickness, width/2, width/2])
                rotate([0, 90, 0])
                    cylinder(h=leg_hole_depth + 1, d=leg_diameter);
        }
        translate([0, width, width])
            rotate([90, 0, 0])
                RightTrianglePrism(
                    sides=[leg_hole_depth + min_thickness, vertical_height - width],
                    thickness=width);
    }
}

if (render_center) {
    for (i = [0:3]) {
        rotate([0, 0, 90*i]) {
            LegSupport(
                leg_diameter=leg_diameter,
                leg_hole_depth=leg_hole_depth,
                min_thickness=min_thickness,
                vertical_diameter=vertical_diameter,
                vertical_height=vertical_height);
            translate([vertical_diameter/2 + min_thickness, vertical_diameter/2 + min_thickness, 0])
                RightTrianglePrism(
                    sides=[leg_hole_depth + min_thickness, leg_hole_depth + min_thickness],
                    thickness=connection_plate_thickness);
        }
    }
    width = vertical_diameter + 2 * min_thickness;
    difference() {
        translate([-width/2, -width/2, 0])
            cube([width, width, vertical_height]);
        translate([0, 0, min_thickness])
            cylinder(h=vertical_height, d = vertical_diameter);
    }
} else {
    width = leg_diameter + 2*min_thickness;
    difference() {
        rotate([0, -90, 0])
            CubeWithBottomCylinder(size=[cap_hole_length + min_thickness, width, width]);
        translate([leg_diameter/2 + min_thickness, 0, min_thickness])
            cylinder(h=cap_hole_length + 1, d=leg_diameter);
    }
}