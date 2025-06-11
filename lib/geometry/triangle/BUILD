load(
    "@rules_openscad//:scad.bzl",
    "scad_library",
    "scad_object",
    "scad_test",
)

scad_library(
    name = "right_triangle",
    srcs = ["right_triangle.scad"],
    visibility = ["//visibility:public"],
)

scad_object(
    name = "right_triangle_obj",
    srcs = ["right_triangle_obj.scad"],
    deps = [":right_triangle"],
)

scad_test(
    name = "right_triangle_test",
    assertions = [
        # sides isn't a list
        "RightTriangle(sides=5)",
        "RightTrianglePrism(sides=5, thickness=1)",

        # sides is a list, but length isn't 2
        "RightTriangle(sides=[])",
        "RightTriangle(sides=[13])",
        "RightTriangle(sides=[45,12,10])",
        "RightTrianglePrism(sides=[], thickness=1)",
        "RightTrianglePrism(sides=[13], thickness=1)",
        "RightTrianglePrism(sides=[45,12,10], thickness=1)",

        # sides are not numbers
        "RightTriangle(sides=[true,1])",
        "RightTriangle(sides=[1,true])",
        "RightTriangle(sides=[\\\"a\\\",1])",
        "RightTriangle(sides=[1,\\\"a\\\"])",
        "RightTrianglePrism(sides=[true,1], thickness=1)",
        "RightTrianglePrism(sides=[1,true], thickness=1)",
        "RightTrianglePrism(sides=[\\\"a\\\",1], thickness=1)",
        "RightTrianglePrism(sides=[1,\\\"a\\\"], thickness=1)",

        # The sides are 0 or smaller
        "RightTriangle(sides=[0,10])",
        "RightTriangle(sides=[-1,10])",
        "RightTriangle(sides=[10,0])",
        "RightTriangle(sides=[10,-1])",
        "RightTrianglePrism(sides=[0,10], thickness=1)",
        "RightTrianglePrism(sides=[-1,10], thickness=1)",
        "RightTrianglePrism(sides=[10,0], thickness=1)",
        "RightTrianglePrism(sides=[10,-1], thickness=1)",

        # Thickness is not a number, 0 or smaller
        "RightTrianglePrism(sides=[10,12], thickness=true)",
        "RightTrianglePrism(sides=[10,12], thickness=\\\"a\\\")",
        "RightTrianglePrism(sides=[10,12], thickness=0)",
        "RightTrianglePrism(sides=[10,12], thickness=-1)",
    ],
    library_under_test = ":right_triangle",
    tests = {
        "testdata/right_triangle/right_triangle_prism.stl":
            "RightTrianglePrism(sides=[10, 15], thickness=2.4)",
    },
)
