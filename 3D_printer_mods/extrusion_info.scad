// Methods to provide information about aluminum extrusion
//
// Currently only 1515 and 2020 extrussions are supported, and the sizes are based on the width (15
// for 1515 and 20 for 2020)

// Get the width of the channel of an extrusion based on its size
function ExtrusionChannelWidth(size) = (size == 20 ? 5.6: size == 15 ? 2.7 : -1);

// Get the depth of the channel of an extrusion based on its size
function ExtrusionChannelDepth(size) = (size == 20 ? 5.6: size == 15 ? 2.7 : -1);
