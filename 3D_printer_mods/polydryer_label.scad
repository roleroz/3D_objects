use <lib/geometry/cube/rounded_cube.scad>

$fn=50;

// Parameters
holderSize = [75, 40];
backThickness = 0.9;
grooveThickness = 3.3;
grooveSide = 1.8;
frontThickness = 1.2;
frontWidth = 3;
oneLayer = 0.3;
tabLength = 5;
tabWidth = 1.2;
distanceToSupport = 0.5;
supportWidth = 3;
labelClearanceHorizontal = 0.5;
labelClearanceVertical = 0.6;
labelRadius = 2;
labelTextHeight = 0.9;
labelTextSize = 8;

// Computed values
labelSize = [holderSize[0] - 2*(grooveSide + labelClearanceHorizontal),
             holderSize[1] - 2*(grooveSide + labelClearanceHorizontal),
             grooveThickness - labelClearanceVertical];

module LabelHolder() {
    // Overall shape
    difference() {
        cube([holderSize[0], holderSize[1], backThickness + grooveThickness + frontThickness]);
        // Remove space for the groove
        translate([grooveSide, grooveSide, backThickness])
            cube([holderSize[0] - 2*grooveSide, holderSize[1], grooveThickness]);
        // Remove space for the front lip
        translate([frontWidth, frontWidth, backThickness + grooveThickness - 0.1])
            cube([holderSize[0] - 2*frontWidth, holderSize[1], frontThickness + 0.2]);
        // Make 2 cuts at both sides of the tabs
        translate([-1, holderSize[1] - tabLength, backThickness])
            cube([holderSize[0] + 2, tabLength + 1, oneLayer]);
        translate([-1, holderSize[1] - tabLength, backThickness + grooveThickness - oneLayer])
            cube([holderSize[0] + 2, tabLength + 1, oneLayer]);
    }

    // Stopper at the end of the tabs
    tabCubeSide = tabWidth * sqrt(2);
    translate([grooveSide, holderSize[1] - 2*tabWidth, backThickness + oneLayer])
        rotate([0, 0, 45])
            cube([tabCubeSide, tabCubeSide, grooveThickness - 2 * oneLayer]);
    translate([holderSize[0] - grooveSide, holderSize[1] - 2*tabWidth, backThickness + oneLayer])
        rotate([0, 0, 45])
            cube([tabCubeSide, tabCubeSide, grooveThickness - 2 * oneLayer]);

    // Support material
    translate([grooveSide + distanceToSupport,
               grooveSide + distanceToSupport,
               backThickness + oneLayer]) {
        cube([supportWidth,
              holderSize[1] - grooveSide - distanceToSupport - 2*tabWidth,
              grooveThickness - 2*oneLayer]);
        cube([holderSize[0] - 2*(grooveSide + distanceToSupport),
              supportWidth,
              grooveThickness - 2*oneLayer]);
    }
    translate([holderSize[0] - grooveSide - distanceToSupport - supportWidth,
               grooveSide + distanceToSupport,
               backThickness + oneLayer])
        cube([supportWidth,
              holderSize[1] - grooveSide - distanceToSupport - 2*tabWidth,
              grooveThickness - 2*oneLayer]);
}

module Label(brand, type) {
    RoundedCube(size=labelSize, r=labelRadius, rounded_bottom=false, rounded_top=False);
    font="Arial:style=Bold";
    translate([labelSize[0]/2, labelSize[1]/2, labelSize[2]])
        linear_extrude(labelTextHeight) {
            translate([0, 1])
                text(brand, font=font, halign="center", valign="bottom", size=labelTextSize);
            translate([0, -1])
                text(type, font=font, halign="center", valign="top", size=labelTextSize);
        }
}

// LabelHolder();
Label("Prusament", "PETG");