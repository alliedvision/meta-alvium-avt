SUMMARY = "Allied Vision V4L2 Test"
HOMEPAGE = "http://alliedvision.com"
LICENSE = "GPLv2+"
LIC_FILES_CHKSUM = "file://LICENSE.md;md5=435d4178fd08b25f9cf911f1c3a0ce1d "
SECTION = "libs"
PR = "r4"

require recipes-qt/qt5/qt5.inc
inherit cmake cmake_qt5

DEPENDS += " qtdeclarative qtbase qtmultimedia qtwayland libpthread-stubs qwt-qt5"

#DEPENDS += " maliit-plugins-qt5 "

RDEPENDS_${PN} += "libpthread-stubs qtbase qtwayland-plugins qtmultimedia qwt-qt5"

BRANCH = "dev"

SRCREV = "f225a38228add956fd894d075a7bf6db1cf4d535"

SRC_URI = "git://git@github.com/alliedvision/V4L2Viewer.git;branch=${BRANCH};protocol=ssh"
#;tag=v${PV}

S = "${WORKDIR}/git"

do_install () {
	install -d ${D}${bindir}
	install -m 0755 ${B}/V4L2Viewer ${D}${bindir}/
	chrpath -d ${D}${bindir}/V4L2Viewer
}


FILES:${PN} += "${bindir}/* "

FILES:${PN}-examples=""
FILES:${PN}-locale=""
FILES:${PN}-plugins=""
FILES:${PN}-qmldesigner=""
FILES:${PN}-qmlplugins=""
FILES:${PN}-src=""
FILES:${PN}-staticdev=""
FILES:${PN}-tools=""
