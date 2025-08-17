load(
    "@rules_openscad//:scad.bzl",
    "scad_library",
    "scad_object",
    "scad_test",
)

scad_library(
    name = "rounded_box",
    srcs = ["rounded_box.scad"],
    visibility = ["//visibility:public"],
)

scad_object(
    name = "rounded_box_obj",
    srcs = ["rounded_box_obj.scad"],
    deps = [":rounded_box"],
)

scad_test(
    name = "rounded_box_test",
    assertions = [
        # Invalid size
        "RoundedBox(size=[-10,15,1.5], side_thickness=1, bottom_thickness=2, radius=0.2)",
        "RoundedBox(size=[10,-15,1.5], side_thickness=1, bottom_thickness=2, radius=0.2)",
        "RoundedBox(size=[10,15,-1.5], side_thickness=1, bottom_thickness=2, radius=0.2)",
        "RoundedBox(size=[10,15], side_thickness=1, bottom_thickness=2, radius=0.2)",
        "RoundedBox(size=[10,15,1.5,12], side_thickness=1, bottom_thickness=2, radius=0.2)",
        "RoundedBox(size=[true,15,1.5], side_thickness=1, bottom_thickness=2, radius=0.2)",
        "RoundedBox(size=[\\\"a\\\",15,1.5], side_thickness=1, bottom_thickness=2, radius=0.2)",
        "RoundedBox(size=[10,true,1.5], side_thickness=1, bottom_thickness=2, radius=0.2)",
        "RoundedBox(size=[10,\\\"a\\\",1.5], side_thickness=1, bottom_thickness=2, radius=0.2)",
        "RoundedBox(size=[10,15,true], side_thickness=1, bottom_thickness=2, radius=0.2)",
        "RoundedBox(size=[10,15,\\\"a\\\"], side_thickness=1, bottom_thickness=2, radius=0.2)",
        "RoundedBox(size=2, side_thickness=1, bottom_thickness=2, radius=0.2)",
        "RoundedBox(size=true, side_thickness=1, bottom_thickness=2, radius=0.2)",
        "RoundedBox(size=\\\"a\\\", side_thickness=1, bottom_thickness=2, radius=0.2)",
        # Invalid side_thickness
        "RoundedBox(size=[10,15,1.5], side_thickness=0, bottom_thickness=2, radius=0.2)",
        "RoundedBox(size=[10,15,1.5], side_thickness=-1, bottom_thickness=2, radius=0.2)",
        "RoundedBox(size=[10,15,1.5], side_thickness=true, bottom_thickness=2, radius=0.2)",
        "RoundedBox(size=[10,15,1.5], side_thickness=\\\"a\\\", bottom_thickness=2, radius=0.2)",
        # Invalid bottom_thickness
        "RoundedBox(size=[10,15,1.5], side_thickness=1, bottom_thickness=0, radius=0.2)",
        "RoundedBox(size=[10,15,1.5], side_thickness=1, bottom_thickness=-1, radius=0.2)",
        "RoundedBox(size=[10,15,1.5], side_thickness=1, bottom_thickness=true, radius=0.2)",
        "RoundedBox(size=[10,15,1.5], side_thickness=1, bottom_thickness=\\\"a\\\", radius=0.2)",
        # Invalid radius is the same as the side_thickness
        "RoundedBox(size=[10,15,1.5], side_thickness=1, bottom_thickness=2, radius=0.5)",
        "RoundedBox(size=[10,15,1.5], side_thickness=1, bottom_thickness=2, radius=-0.5)",
        "RoundedBox(size=[10,15,1.5], side_thickness=1, bottom_thickness=2, radius=true)",
        "RoundedBox(size=[10,15,1.5], side_thickness=1, bottom_thickness=2, radius=\\\"a\\\")",
    ],
    library_under_test = ":rounded_box",
    tests = {
        "testdata/rounded_box/rounded_box.stl": "RoundedBox(size=[10,15,1.5], side_thickness=1, bottom_thickness=2, radius=0.2)",
        "testdata/rounded_box/almost_round.stl": "RoundedBox(size=[10,15,1.5], side_thickness=1.0001, bottom_thickness=2, radius=0.5)",
        "testdata/rounded_box/square_box.stl": "RoundedBox(size=[10,15,1.5], side_thickness=1, bottom_thickness=2, radius=0)",
    },
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
        "testdata/rounded_cube/flat_bottom.stl": "RoundedCube(size=[10,15,20], r=1, rounded_bottom=false)",
        "testdata/rounded_cube/flat_top.stl": "RoundedCube(size=[10,15,20], r=1, rounded_top=false)",
        "testdata/rounded_cube/flat_bottom_and_top.stl": "RoundedCube(size=[10,15,20], r=1, rounded_bottom=false, rounded_top=false)",
        "testdata/rounded_cube/big_round_with_flat_bottom.stl": "RoundedCube(size=[10,15,1.5], r=1, rounded_bottom=false)",
        "testdata/rounded_cube/big_round_with_flat_top.stl": "RoundedCube(size=[10,15,1.5], r=1, rounded_top=false)",
        "testdata/rounded_cube/big_round_with_flat_bottom_and_top.stl": "RoundedCube(size=[10,15,1.5], r=1, rounded_bottom=false, rounded_top=false)",
    },
)
