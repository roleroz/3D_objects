use <lib/geometry/cube/rounded_box.scad>

$fn=50;
// RoundedBox(size=[10,15,1.5], side_thickness=1, bottom_thickness=2, radius=0.2); // testdata/rounded_box/rounded_box.stl
// RoundedBox(size=[10,15,1.5], side_thickness=1.0001, bottom_thickness=2, radius=0.5); // testdata/rounded_box/almost_round.stl
RoundedBox(size=[10,15,1.5], side_thickness=1, bottom_thickness=2, radius=0); // testdata/rounded_box/square_box.stl
