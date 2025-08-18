// Shelf with a lip that can be used with Ikea Skadis pegboards
//
// Use the brackets provided in this directory to hang this shelf from a Skadis pegboard
//
// You need to set the size of the shelf and the hole sizing to build this object

use <lib/geometry/cube/rounded_box.scad>

$fn=50;

// Set this variable to the size of the shelf needed. Below there are a few pre-measured cases for
// some Lego technic car sets (with set number)

// Wide shelfs
// size=[300, 135];  // Bugatti Bolide 42162
// size=[275, 132];  // Ford Mustang Shelby GT500 42138
// size=[213, 140];  // Jeep Wrangler 42122
size=[280, 130];  // Koenigsegg Jesko 42173
// size=[296, 130];  // Lamborghini Huracan 42161
// size=[295, 135];  // McLaren Senna 42123
// size=[170, 120];  // Megalodon 42134
// size=[200, 115];  // Monster Jam El Toro Loco 42135
// size=[282, 135];  // Nascar 42153
// size=[290, 125];  // NEOM McLaren Formula E 42169
// size=[300, 130];  // Porsche Formula E 42137

// Narrow shelfs
// size=[170, 80];  // Motorcycle 42132
// size=[210, 80];  // Mobile Crane 60324
// size=[215, 80];  // Mack LR Electric Garbage Truck 42167


// Set this variable to the size of the holes to be put on the bottom of the shelf. This needs to
// align with the bracket sizes that you will use
support_hole_size=[4.9, 90.4, 2.5];  // Wide shelfs
// support_hole_size=[4.9, 60.4, 2.5];  // Narrow shelfs

module SkadisShelfWithLip(
    dimensions,
    side_thickness,
    bottom_thickness,
    radius,
    support_hole_size,
    support_hole_distance_from_side) {

    support_hole_distance_from_edge = (dimensions[0] % 40) / 2 + 20;
    difference() {
        RoundedBox(dimensions, side_thickness, bottom_thickness, radius);
        translate([
            support_hole_distance_from_edge - support_hole_size[0]/2,
            support_hole_distance_from_side,
            -0.1])
            cube(support_hole_size + [0, 0, 0.1]);
        translate([
            dimensions[0] - support_hole_distance_from_edge - support_hole_size[0]/2,
            support_hole_distance_from_side,
            -0.1])
            cube(support_hole_size + [0, 0, 0.1]);
    }
}

SkadisShelfWithLip(
    dimensions=[size[0], size[1], 11],
    side_thickness=1.8,
    bottom_thickness=4,
    radius=0.5,
    support_hole_size=support_hole_size,
    support_hole_distance_from_side=9.8);
