// Functions to round 2D objects

// Round the inside corners of the child 2D object
module RoundPolygonInsideCorners(r) {
    offset(r=-r) offset(delta=r) children();
}

// Round the outside corners of the child 2D object
module RoundPolygonOutsideCorners(r) {
    offset(r=r) offset(delta=-r) children();
}

// Round all corners (both inside and outside) of the child 2D object
module RoundPolygonCorners(r) {
    RoundPolygonInsideCorners(r)
        RoundPolygonOutsideCorners(r)
            children();
}
