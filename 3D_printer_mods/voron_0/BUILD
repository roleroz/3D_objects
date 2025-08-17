load("@rules_openscad//:scad.bzl", "scad_object")

scad_object(
    name = "hbv1825_camera_mount",
    srcs = ["hbv1825_camera_mount.scad"],
    deps = [
        "//lib/geometry/cube:rounded_cube",
    ],
)

scad_object(
    name = "U2C_mount",
    srcs = ["U2C_mount.scad"],
    deps = [
        "//lib/operations:round",
    ]
)
