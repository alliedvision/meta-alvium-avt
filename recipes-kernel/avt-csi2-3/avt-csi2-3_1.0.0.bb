SUMMARY = "Allied Vision Alvium external Linux kernel module"
LICENSE = "GPL-2.0-only"
LIC_FILES_CHKSUM = "file://COPYING;md5=12f884d2ae1ff87c09e5b7ccc2c4ca7e"

inherit module

AVT_GIT_REPO = "alvium-csi2-driver"
AVT_GIT_BRANCH = "main"
SRCREV = "324b583d48b8c22a89025c768be00045bf82ee34"

require recipes-avt/common/avt_git.inc

S = "${WORKDIR}/git"

PV = "1.0.0+git${SRCPV}"

# The inherit of module.bbclass will automatically name module packages with
# "kernel-module-" prefix as required by the oe-core build environment.

RPROVIDES_${PN} += "kernel-module-avt-csi2-3"

FILES_${PN} += "${libdir}/modules/${KERNEL_VERSION}/extra/*.ko"
#FILES_${PN} += "${nonarch_base_libdir}/modules/${KERNEL_VERSION}/extra/*.ko"

LOCALVERSION = "1.0.0"
KERNEL_MODULE_AUTOLOAD += "avt-csi2-3"

