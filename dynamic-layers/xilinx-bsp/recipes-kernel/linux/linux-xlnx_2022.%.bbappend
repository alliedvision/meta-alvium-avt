#FILESEXTRAPATHS:prepend := "${THISDIR}/../avt-csi2-3/files/:${THISDIR}/${PN}/files:"
FILESEXTRAPATHS:prepend := "${THISDIR}/${PN}/files/v2022.1:${THISDIR}/${PN}/files:"
#${THISDIR}/../avt-csi2-3/files/:${THISDIR}/../ds90ub95xq1/files/:
#rev=<revision>;subdir=second_repo

require recipes-kernel/linux/linux-avt-common.inc

SRC_URI += " \
	file://drm_misc.cfg \
	file://sensors.cfg \
	"
#	file://video_xilinx_modules.cfg \
#	file://sensors.cfg \
#

do_patch:append() {
   cp -vfr ${B}/../drivers  ${STAGING_KERNEL_DIR}
   cp -vfr ${B}/../include  ${STAGING_KERNEL_DIR}
}

