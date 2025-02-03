use <rounded_cube.scad>

$fn=50;
// RoundedCube(size=[10,15,20], r=1); // testdata/rounded_cube/cube.stl
// RoundedCube(size=[10,15,20], r=1, rounded_bottom=false); // testdata/rounded_cube/flat_bottom.stl
RoundedCube(size=[10,15,1.5], r=1, rounded_bottom=false); // testdata/rounded_cube/big_round_with_flat_bottom.stl
