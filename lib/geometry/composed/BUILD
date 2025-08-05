load(
    "@rules_openscad//:scad.bzl",
    "scad_library",
    "scad_object",
    "scad_test",
)

scad_library(
    name = "cube_with_botton_cylinder",
    srcs = ["cube_with_botton_cylinder.scad"],
    visibility = ["//visibility:public"],
)

scad_object(
    name = "cube_with_botton_cylinder_obj",
    srcs = ["cube_with_botton_cylinder_obj.scad"],
    deps = [":cube_with_botton_cylinder"],
)

scad_test(
    name = "cube_with_botton_cylinder_test",
    assertions = [
        # Invalid size
        "CubeWithBottomCylinder(size=[-10,15,1.5])",
        "CubeWithBottomCylinder(size=[10,-15,1.5])",
        "CubeWithBottomCylinder(size=[10,15,-1.5])",
        "CubeWithBottomCylinder(size=[10,15])",
        "CubeWithBottomCylinder(size=[10,15,1.5,12])",
        "CubeWithBottomCylinder(size=[true,15,1.5])",
        "CubeWithBottomCylinder(size=[\\\"a\\\",15,1.5])",
        "CubeWithBottomCylinder(size=[10,true,1.5])",
        "CubeWithBottomCylinder(size=[10,\\\"a\\\",1.5])",
        "CubeWithBottomCylinder(size=[10,15,true])",
        "CubeWithBottomCylinder(size=[10,15,\\\"a\\\"])",
        "CubeWithBottomCylinder(size=2)",
        "CubeWithBottomCylinder(size=true)",
        "CubeWithBottomCylinder(size=\\\"a\\\")",
        # Not enough height for the bottom cylinder
        "CubeWithBottomCylinder(size=[20, 30, 5])",
    ],
    library_under_test = ":cube_with_botton_cylinder",
    tests = {
        "testdata/cube_with_botton_cylinder/cube_with_bottom_cylinder.stl": "CubeWithBottomCylinder(size=[20, 30, 50]);",
        "testdata/cube_with_botton_cylinder/too_thin_cube.stl": "CubeWithBottomCylinder(size=[20, 30, 25]);",
    },
)
