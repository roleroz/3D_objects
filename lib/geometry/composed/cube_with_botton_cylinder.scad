// A cube with half a cylinder underneath
//
// The cylinder is centered on the X axis
//
// The origin of the object is at the lowest value for X, the mid value for Y and the highest value
// for Z 
// 
// Args:
// - size (float[3] > [0, 0, 0]): The size of the bounding box around this object box
module CubeWithBottomCylinder(size) {
    assert(is_list(size), "size must be a list of 3 positive numbers");
    assert(len(size) == 3, "size must have 3 dimensions");
    for (i=[0:2]) {
        echo(size[i]);
        assert(is_num(size[i]), " size must contain only numbers");
        assert(size[i] > 0, "All size dimensions must be greater than 0");
    }
    assert(size[1]/2 < size[2], "Not enought height for the cylinder diameter");
    cube_size = [size[0], size[1], size[2] - size[1]/2];
    difference() {
        union() {
            translate([0, -cube_size[1]/2, -cube_size[2]])
                cube(cube_size);
            translate([0, 0, -cube_size[2]])
                rotate([0, 90, 0])
                    cylinder(d=cube_size[1], h=cube_size[0]);
        }
        translate([-1, -size[1]/2, 0])
            cube(size=size + [2, 2, 1]);
    }
}
