load(
    "@rules_openscad//:scad.bzl",
    "scad_library",
    "scad_object",
    # "scad_test",
)

scad_object(
    name = "45_degree_bracket_with_truss",
    srcs = ["45_degree_bracket_with_truss.scad"],
    deps = [
        ":peg",
        "//lib/geometry/triangle:right_triangle",
    ],
)

scad_library(
    name = "peg",
    srcs = ["peg.scad"],
    deps = [
        "//lib/geometry/composed:cube_with_botton_cylinder"
    ],
    visibility = ["//visibility:public"],
)

scad_object(
    name = "peg_obj",
    srcs = ["peg_obj.scad"],
    deps = [":peg"],
)

# scad_test(
#     name = "peg_test",
#     assertions = [
#         # Invalid count
#         "SkadisMultiPeg(count=0)",
#         "SkadisMultiPeg(count=1.5)",
#         "SkadisMultiPeg(count=-1)",
#         "SkadisMultiPeg(count=true)",
#         "SkadisMultiPeg(count=\\\"a\\\")",
#         "SkadisMultiPeg(count=[9])",
#     ],
#     library_under_test = ":peg",
#     tests = {
#         "testdata/peg/peg.stl": "SkadisPeg()",
#         "testdata/peg/single_multi_peg.stl": "SkadisMultiPeg(count=1)",
#         "testdata/peg/multi_peg.stl": "SkadisMultiPeg(count=3)",
#     },
# )

scad_object(
    name = "shelf_with_lip",
    srcs = ["shelf_with_lip.scad"],
    deps = [
        "//lib/geometry/cube:rounded_box",
    ],
)

scad_object(
    name = "straight_bracket",
    srcs = ["straight_bracket.scad"],
    deps = [
        ":peg",
        "//lib/geometry/triangle:right_triangle",
    ],
)
