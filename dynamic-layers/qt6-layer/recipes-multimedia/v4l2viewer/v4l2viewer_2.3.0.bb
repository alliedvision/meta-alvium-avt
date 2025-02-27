inherit qt6-cmake

require recipes-multimedia/v4l2viewer/v4l2viewer.inc

RDEPENDS:${PN} += "qtwayland"

