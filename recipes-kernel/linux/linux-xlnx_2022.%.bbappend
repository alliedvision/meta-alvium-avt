#FILESEXTRAPATHS:prepend := "${THISDIR}/../avt-csi2-3/files/:${THISDIR}/${PN}/files:"
FILESEXTRAPATHS:prepend := "${THISDIR}/5.15:${THISDIR}/${PN}/files/v2022.1:${THISDIR}/${PN}/files:${THISDIR}/files:"
#${THISDIR}/../avt-csi2-3/files/:${THISDIR}/../ds90ub95xq1/files/:
#rev=<revision>;subdir=second_repo 

DEPENDS += "avt-csi2-3-xlnx-helper"
RDEPENDS:virtual/kernel += "avt-csi2-3-xlnx-helper"

SRC_URI += " \ 
	file://libcsi_ioctl.h;subdir=git/include/uapi/linux/ \	
	file://sensors.cfg \
	file://iio_ina.cfg \
	file://adv_v4l_dbg.cfg \
	"
# to be removed for next lts kernel
SRC_URI += " \ 
    file://mipi-csi2.h;subdir=git/include/media \
	"

SRC_URI += " \
	file://drm_misc.cfg \
	file://0001-avt_csi2_3-in-tree-compile.patch \
	file://${DEPLOY_DIR_IMAGE}/avt-csi2-3-xlnx-helper.tar.gz \
	"
#	file://video_xilinx_modules.cfg \
#	file://sensors.cfg \
#

do_patch:append() {
   cp -vfr ${B}/../drivers  ${STAGING_KERNEL_DIR}
   cp -vfr ${B}/../include  ${STAGING_KERNEL_DIR}
}

