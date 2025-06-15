// A box with walls on 5 sides and rounded edges
//
// The origin of the object is in what would be the smallest [x,y,z] corner on
// a non-rounded cube
//
// Args:
// - size (float[3] > [0, 0, 0]): The internal size of the box
// - side_thickness (float > 0): The thickness of the front, back, left and right walls
// - bottom thickness (float > 0): The thickness of the bottom of the box
// - radius (float in [0, side_thickness/2[): The radius of the rounding for all edges
module RoundedBox(size, side_thickness, bottom_thickness, radius) {
    assert(is_list(size), "size must be a list of 3 positive numbers");
    assert(len(size) == 3, "size must have 3 dimensions");
    for (i=[0:2]) {
        assert(is_num(size[i]), " size must contain only numbers");
        assert(size[i] > 0, "All size dimensions must be greater than 0");
    }
    assert(is_num(side_thickness), "side_thickness must be a positive number");
    assert(side_thickness > 0, "side_thickness must be a positive number");
    assert(is_num(bottom_thickness), "bottom_thickness must be a positive number");
    assert(bottom_thickness > 0, "bottom_thickness must be a positive number");
    assert(is_num(radius), "radius must be a number greater or equal than 0");
    assert(radius >= 0, "radius must be a number greater or equal than 0");
    assert(radius < side_thickness/2, "radius must be smaller than side_thickness/2");
    outer_dimension =
        size
        + [2*side_thickness, 2*side_thickness, bottom_thickness]
        - 2*[radius, radius, radius];
    inner_dimensions = size + 2*[radius, radius, radius];
    minkowski() {
        difference() {
            translate([radius, radius, radius])
                cube(outer_dimension);
            translate(
                [side_thickness, side_thickness, bottom_thickness]
                - [radius, radius, radius])
                cube(inner_dimensions);
        }
        sphere(r=radius);
    }
}
