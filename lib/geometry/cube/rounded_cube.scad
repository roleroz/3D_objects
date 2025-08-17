// Provides a cube with rounded edges. You can also ask for some sides of it to
// not be rounded
//
// The origin of the object is in what would be the smallest [x,y,z] corner on
// a non-rounded cube
module RoundedCube(size, r, rounded_bottom=true, rounded_top=true) {
    for(i = [0:2])
        assert(
            size[i] + extra_size[i] > 2 * r,
            str("Cube dimension must be bigger than twice the rounding ",
                "radius"));
    extra_height = (rounded_bottom ? 0: 1) + (rounded_top ? 0: 1);
    extra_size = [0, 0, extra_height * r];
    extra_translate = [0, 0, rounded_bottom ? 0 : -r];
    difference() {
        translate([r,r,r] + extra_translate) {
            minkowski() {
                cube(size + extra_size - 2*[r,r,r]);
                sphere(r=r);
            }
        }
        if (!rounded_bottom) {
            translate([-1, -1, -2 * r - 1])
                cube([size[0] + 2, size[1] + 2, 2 * r + 1]);

        }
        if (!rounded_top) {
            translate([-1, -1, size[2]])
                cube([size[0] + 2, size[1] + 2, 2 * r + 1]);
        }
    }
}
