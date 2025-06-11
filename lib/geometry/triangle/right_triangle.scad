// Right triangle (in 2D) with the right angle on the origin and the catheti over X and Y
//
// Args:
// - sides (float[2]): Dimensions of the 2 catheti for the triangle ([0] in X and [1] in Y). These
//   values must be greater than 0
module RightTriangle(sides) {
    // Check that sides is a list of length 2
    assert(is_list(sides), "sides must be a list of 2 numbers");
    assert(len(sides) == 2, "sides must be a list of 2 numbers");
    // Check that sides are numbers greater than 0
    for (i=[0:1]) {
        assert(is_num(sides[i]), "sides need to contain only numbers");
        assert(sides[i] > 0, "sides need to be greater than 0");
    }
    polygon([[0,0], [sides[0],0], [0,sides[1]]]);
}

// Extrusion of a right triangle with the right angle on the origin the catheti over X and Y, and
// extruded over Z
//
// Args:
// - sides (float[2] > [0, 0]): Dimensions of the 2 catheti for the triangle ([0] in X and [1] in Y)
// - thickness (float > 0): Dimension in Z (how much the right triangle is extruded)
module RightTrianglePrism(sides, thickness) {
    // Check that thickness is a number greater than 0
    assert(is_num(thickness), "thickness must be a number");
    assert(thickness > 0, "thickness must be greater than 0");
    linear_extrude(height=thickness)
        RightTriangle(sides=sides);
}
