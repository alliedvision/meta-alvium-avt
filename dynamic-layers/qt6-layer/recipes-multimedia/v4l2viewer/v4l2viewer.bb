SUMMARY = "Allied Vision Video4Linux2 Viewer"
LICENSE = "GPL-2.0-or-later"
LIC_FILES_CHKSUM = "file://LICENSE.md;md5=435d4178fd08b25f9cf911f1c3a0ce1d"


inherit qt6-cmake

DEPENDS:append = " qtbase "

AVT_GIT_REPO = "V4L2Viewer"
AVT_GIT_BRANCH = "dev"
SRCREV = "${AUTOREV}"

require recipes-avt/common/avt_git.inc

SRC_URI += " \
           file://0001-Fixed-installation-for-yocto.patch \
           file://0002-Use-mmap-by-default-because-the-imx8-does-not-suppor.patch \
           "

S = "${WORKDIR}/git"

PV = "2022-1-beta+git${SRCPV}"
