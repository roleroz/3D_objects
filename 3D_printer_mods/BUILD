load(
    "@rules_openscad//:scad.bzl",
    "scad_library",
    "scad_object",
)

scad_library(
    name = "extrusion_info",
    srcs = ["extrusion_info.scad"],
    visibility = ["//visibility:public"],
)

scad_object(
    name = "pcb_support",
    srcs = ["pcb_support.scad"],
    deps = [
        ":extrusion_info",
        "//lib/geometry/cube:rounded_cube",
    ],
)
