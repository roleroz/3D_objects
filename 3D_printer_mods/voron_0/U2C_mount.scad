// Support for BTT's U2C model on a Voron v0
//
// This model provides 2 towers to screw the U2C module into, with 2 holes each where to put M3
// heat press inserts

use <lib/operations/round_2d.scad>

$fn = 50;

module ConnectorOpening() {
    linear_extrude(4)
        RoundPolygonCorners(1)
            union() {
                square([8.5, 14.5]);
                square([20, 10.5]);
            }
}

module screwSlot2D() {
    square([3, 3.5]);
    translate([3, 1.75]) circle(d=3.5);
}

module Plate() {
    difference() {
        linear_extrude(3) {
            difference() {
                RoundPolygonOutsideCorners(2)
                    difference() {
                        square([122, 37]);
                        translate([0, 18.75]) square([3, 3.5]);
                        translate([119, 18.75]) square([3, 3.5]);
                        translate([8, 33]) square([7, 5]);
                        translate([107, 33]) square([7, 5]);
                    }
                translate([0, 18.75]) screwSlot2D();
                translate([122, 18.75]) mirror([1, 0]) screwSlot2D();
            }
        }
        translate([2, 2, 1]) linear_extrude(3) {
            RoundPolygonCorners(1) {
                difference() {
                    square([118, 33]);
                    translate([0, 14.75]) square([4.75, 7.5]);
                    translate([113.25, 14.75]) square([4.75, 7.5]);
                    translate([4, 29]) square([11, 5]);
                    translate([103, 29]) square([11, 5]);
                }
            }
        }
    }
}

tower_dimensions = [10, 12, 30];
distance_between_towers = 79.33;

module ScrewTower() {
    roundover_radius = 1;
    roundover_dimensions = [roundover_radius, roundover_radius, roundover_radius];
    screw_heights = [4, 23.23];
    screw_hole_diameter = 4.7;
    screw_hole_depth = 7;
    difference() {
        translate(roundover_dimensions) minkowski() {
            cube(tower_dimensions - 2*roundover_dimensions);
            sphere(roundover_radius);
        }
        for (height = screw_heights) {
            translate([tower_dimensions[0]/2, -1, height])
                rotate([-90, 0, 0])
                    cylinder(h=screw_hole_depth + 1, d=screw_hole_diameter);
        }
    }
}

module ScrewTowers() {
    ScrewTower();
    translate([distance_between_towers, 0, 0]) ScrewTower();
}

difference() {
    Plate();
    translate([
        (122 + distance_between_towers)/2 - 14,
        23,
        -1]) rotate([0, 0, 180]) ConnectorOpening();
}
translate([
    (122 - distance_between_towers - tower_dimensions[0])/2,
    37 - tower_dimensions[1],
    0]) ScrewTowers();
