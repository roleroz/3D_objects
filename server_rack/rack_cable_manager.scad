// Standard rack unit height in mm
U_HEIGHT = 44.45;

$fn = 16;

// Helper module for creating a negative fillet (quarter-round concave shape).
module NegativeFillet(r, h) {
  translate([h, 0, 0])
    rotate([0, -90, 0])
      linear_extrude(height=h)
        difference() {
          square([r, r]);
          translate([r, r]) circle(r=r);
        }
}

// Creates a server rack cable manager.
//
// Args:
// - num_units (int): The number of rack units (U) the cable manager covers.
// - finger_length (float): The length of the cable management fingers.
module RackCableManager(num_units, finger_length) {
  thickness = 5;
  base_width = 35;
  finger_width = 10;
  cap_protrusion = 13;
  fillet_radius = 5;
  edge_radius = 1;
  hole_dia = 7;
  hole_offset = 22;
  hole_interval = 20;

  total_height = num_units * U_HEIGHT;

  // Common shrunken values for minkowski core
  double_edge_radius = 2 * edge_radius;
  shrunken_thickness = thickness - double_edge_radius;
  shrunken_base = base_width - double_edge_radius;
  shrunken_height = total_height - double_edge_radius;
  shrunken_finger_width = finger_width - double_edge_radius;
  shrunken_finger_length = finger_length - edge_radius;
  shrunken_cap_height = finger_width + 2 * cap_protrusion - double_edge_radius;

  difference() {
    minkowski() {
      // offset(delta=-edge_radius) offset(delta=edge_radius) {
      // Core assembly, shrunken by edge_radius on all sides
      translate([edge_radius, -edge_radius, edge_radius]) {
        // Attachment Base
        translate([0, 2 * edge_radius - base_width, 0])
          cube([shrunken_thickness, shrunken_base, shrunken_height]);

        // Fingers
        for (i = [0:num_units - 1]) {
          z_pos = i * U_HEIGHT + (U_HEIGHT - finger_width) / 2 - edge_radius;

          // Finger
          // Horizontal finger
          translate([0, 0, z_pos]) {
            cube([shrunken_thickness, shrunken_finger_length, shrunken_finger_width]);

            // End cap
            translate([0, finger_length - shrunken_thickness, -cap_protrusion])
              cube([shrunken_thickness, shrunken_thickness, shrunken_cap_height]);
          }

          // Fillets
          // Base-finger fillets
          // Top
          translate([0, 0, z_pos + shrunken_finger_width])
            NegativeFillet(r=fillet_radius, h=shrunken_thickness);
          // Bottom
          translate([0, 0, z_pos])
            rotate([-90, 0, 0])
              NegativeFillet(r=fillet_radius, h=shrunken_thickness);

          // Finger-cap fillets
          // Top
          translate([0, finger_length - shrunken_thickness, z_pos + shrunken_finger_width])
            rotate([90, 0, 0])
              NegativeFillet(r=fillet_radius, h=shrunken_thickness);
          // Bottom
          translate([0, finger_length - shrunken_thickness, z_pos])
            rotate([-180, 0, 0])
              NegativeFillet(r=fillet_radius, h=shrunken_thickness);
        }
      }
      sphere(r=edge_radius);
    }

    // Mounting holes in the base
    num_holes = floor(total_height / hole_interval);
    for (j = [0:num_holes - 1]) {
      z_hole = (total_height - (num_holes - 1) * hole_interval) / 2 + j * hole_interval;
      translate([-1, -hole_offset, z_hole])
        rotate([0, 90, 0])
          cylinder(d=hole_dia, h=thickness + 2, $fn=32);
    }
  }
}

// Example instance
RackCableManager(num_units=2, finger_length=50);
