SUMMARY = "Allied Vision Video4Linux2 Viewer"
LICENSE = "GPL-2.0-or-later"
LIC_FILES_CHKSUM = "file://LICENSE.md;md5=435d4178fd08b25f9cf911f1c3a0ce1d"




DEPENDS:append = " qtbase "

AVT_GIT_REPO = "V4L2Viewer"
AVT_GIT_BRANCH = "dev"
SRCREV = "990b75deaa192e2240b4e6bac3f540ccf078bad5"

require recipes-avt/common/avt_git.inc

S = "${WORKDIR}/git"

PV = "2.2.0+git${SRCPV}"

do_install() {
	install -d ${D}${bindir}
	install -m 755 ${B}/V4L2Viewer ${D}${bindir}/V4L2Viewer
    chrpath -d ${D}${bindir}/V4L2Viewer
}
