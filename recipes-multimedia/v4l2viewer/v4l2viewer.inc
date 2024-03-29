SUMMARY = "Allied Vision Video4Linux2 Viewer"
LICENSE = "GPL-2.0-or-later"
LIC_FILES_CHKSUM = "file://LICENSE.md;md5=435d4178fd08b25f9cf911f1c3a0ce1d"




DEPENDS:append = " qtbase "

AVT_GIT_REPO = "V4L2Viewer"
AVT_GIT_BRANCH = "dev"
SRCREV = "86e711c52c708a1491337cdd540b47d3711b4991"

require recipes-avt/common/avt_git.inc

S = "${WORKDIR}/git"

PV = "2.2.1+git${SRCPV}"

do_install() {
	install -d ${D}${bindir}
	install -m 755 ${B}/V4L2Viewer ${D}${bindir}/V4L2Viewer
    chrpath -d ${D}${bindir}/V4L2Viewer
}
