// Cup to keep a T-gun for a Fuji HVLP system to prevent it from tiping when putting it over a table
//
// This model contains a hole that allows you to put a 1/4-20 bolt (or similar) to bolt it to the
// table, this bolt it perfect to hold this with a t-track

$fn = 500;

difference() {
    cylinder(d=116, h=100);
    translate([0, 0, 10]) cylinder(d=110, h=110);
    translate([0, 0, -1]) cylinder(d=8, h=30);
    translate([0, 0, 3]) cylinder(d=20, h=15);
}