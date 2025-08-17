// Model for a handle to more easily grab and use a physical therapy rubber band

$fn=50;

difference() {
    cylinder(h=110,d=40);
    translate([-2,-3,-5]) cube([4, 30, 120]);
}
translate([1.5, 3, 0]) cube([1,2,110]);
translate([-2.5, 3, 0]) cube([1,2,110]);
