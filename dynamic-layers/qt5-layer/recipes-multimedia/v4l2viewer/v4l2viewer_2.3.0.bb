inherit cmake cmake_qt5

require recipes-multimedia/v4l2viewer/v4l2viewer.inc

DEPENDS += " qtdeclarative qtbase qtmultimedia qtwayland libpthread-stubs qwt-qt5"

#DEPENDS += " maliit-plugins-qt5 "

RDEPENDS:${PN} += "qtbase qtwayland qtmultimedia qwt-qt5"

FILES:${PN} += "${bindir}/* "

FILES:${PN}-examples=""
FILES:${PN}-locale=""
FILES:${PN}-plugins=""
FILES:${PN}-qmldesigner=""
FILES:${PN}-qmlplugins=""
FILES:${PN}-src=""
FILES:${PN}-staticdev=""
FILES:${PN}-tools=""
