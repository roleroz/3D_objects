load(
    "@rules_openscad//:scad.bzl",
    "scad_library",
    "scad_object",
    "scad_test",
)

scad_library(
    name = "hardware",
    srcs = ["hardware.scad"],
    visibility = ["//visibility:public"],
)

scad_object(
    name = "hardware_obj",
    srcs = ["hardware_obj.scad"],
    deps = [":hardware"],
)

scad_test(
    name = "hardware_test",
    library_under_test = ":hardware",
    tests = {
        "testdata/hardware/m2_nut.stl": "M2Nut(extra_thickness=1)",
    },
)
