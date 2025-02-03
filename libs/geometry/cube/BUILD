load(
    "@rules_openscad//:scad.bzl",
    "scad_library",
    "scad_object",
    "scad_test",
)

scad_library(
    name = "rounded_cube",
    srcs = ["rounded_cube.scad"],
    visibility = ["//visibility:public"],
)

scad_object(
    name = "rounded_cube_obj",
    srcs = ["rounded_cube_obj.scad"],
    deps = [":rounded_cube"],
)

scad_test(
    name = "rounded_cube_test",
    assertions = [
        # The rounded diameter is the same as the dimention in one axis
        "RoundedCube(size=[2,15,20], r=1)",
        "RoundedCube(size=[10,2,20], r=1)",
        "RoundedCube(size=[10,15,2], r=1)",
        # The rounded diameter is more as the dimention in one axis
        "RoundedCube(size=[1,15,20], r=1)",
        "RoundedCube(size=[10,1,20], r=1)",
        "RoundedCube(size=[10,15,1], r=1)",
    ],
    library_under_test = ":rounded_cube",
    tests = {
        "testdata/rounded_cube/cube.stl": "RoundedCube(size=[10,15,20], r=1)",
        "testdata/rounded_cube/flat_bottom.stl":
            "RoundedCube(size=[10,15,20], r=1, rounded_bottom=false)",
        "testdata/rounded_cube/big_round_with_flat_bottom.stl":
            "RoundedCube(size=[10,15,1.5], r=1, rounded_bottom=false)",
    },
)

