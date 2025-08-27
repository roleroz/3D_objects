load(
    "@rules_openscad//:scad.bzl",
    "scad_object",
)

scad_object(
    name = "flagpole_base",
    srcs = ["flagpole_base.scad"],
    deps = [
        "//lib/geometry/composed:cube_with_bottom_cylinder",
        "//lib/geometry/triangle:right_triangle",
    ]
)

scad_object(
    name = "rubber_band_handle",
    srcs = ["rubber_band_handle.scad"],
)
