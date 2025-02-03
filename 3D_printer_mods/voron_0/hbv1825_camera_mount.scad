use <lib/geometry/cube/rounded_cube.scad>

$fn=50;

// Parameters
rounded_radius = 0.4;
side_thickness = 2;
pcb_size = [63, 9.3, 2];
connector_height = 3.3;
connector_width = 5;
ear_length = 10;
mounting_screw_hole_diameter = 3.5;

// Camera
camera_height = 4.5;
camera_lens_diameter = 5.5;
camera_housing_height = 3.8;
camera_housing_width = 8.6;
camera_position = 28.3;

// Screws
double_screw_length = 3.5;
single_screw_position = 50.1;
single_screw_size = [5, 4];
screw_positions = [
    [2.2, 2.4],
    [2.2, 6.55],
    [52.3, 6.9]];
screw_hole_diameter = 1;
screw_hole_depth = 5;


// Computed params
box_size = pcb_size + [
    side_thickness,
    2 * side_thickness,
    camera_height
];
empty_size = box_size - [0, 2 * side_thickness, 0];
echo (box_size);

// Modules

module CameraMount() {
    difference() {
        union() {
            difference() {
                // Main body
                RoundedCube(box_size, rounded_radius, rounded_bottom=false);
                // Remove inner space
                translate([side_thickness, side_thickness, -side_thickness])
                    RoundedCube(empty_size, rounded_radius, rounded_bottom=false);
                // Remove casing for the camera
                translate([side_thickness + camera_position, side_thickness, 0]) {
                    cube([empty_size[1], empty_size[1], pcb_size[2] + camera_housing_height]);
                    // Remove hole for camera lens
                    translate([empty_size[1]/2, empty_size[1]/2, 0])
                        cylinder(h=100, d=camera_lens_diameter);
                }
                // Remove room for the connector
                translate([box_size[0] - connector_width, side_thickness, 0])
                    RoundedCube(
                        [
                            connector_width + rounded_radius,
                            empty_size[1],
                            pcb_size[2] + connector_height
                        ],
                        rounded_radius);
            }
            // Add support for the 2 screws at the beginning of the PCB
            translate([side_thickness, 0, pcb_size[2]])
                cube([double_screw_length, box_size[1], box_size[2] - pcb_size[2] - side_thickness]);
            // Add support for the single screw at the end of the PCB
            translate([
                side_thickness + single_screw_position,
                box_size[1] - side_thickness - single_screw_size[1],
                pcb_size[2]])
                cube([
                    single_screw_size[0],
                    single_screw_size[1],
                    box_size[2] - pcb_size[2] - side_thickness]);
        }
        // Add screw holes for all 3 screws
        for (i = [0: len(screw_positions) - 1]) {
            translate([
                side_thickness + screw_positions[i][0],
                side_thickness + screw_positions[i][1],
                0])
                cylinder(h=screw_hole_depth, d=screw_hole_diameter);
        }
        // Remove the rounded edge to support a square PCB
        translate([side_thickness, side_thickness, -1]) cube(pcb_size + [0, 0, 1]);
    }
    
    // Add ears
    translate([0, box_size[1] - side_thickness, 0]) {
        difference() {
            // Main ear section
            translate([-ear_length, 0, 0])
                RoundedCube(
                    [box_size[0] + 2 * ear_length, side_thickness, box_size[2]],
                    rounded_radius,
                    rounded_bottom=false);
            // First mounting screw hole
            translate([-ear_length / 2, -1, box_size[2] / 2])
                rotate([-90, 0, 0])
                    cylinder(h = side_thickness + 2, d = mounting_screw_hole_diameter);
            // Second mounting screw hole
            translate([box_size[0] + ear_length / 2, -1, box_size[2] / 2])
                rotate([-90, 0, 0])
                    cylinder(h = side_thickness + 2, d = mounting_screw_hole_diameter);
        }
    }
}

rotate([180, 0, 0])
    CameraMount();