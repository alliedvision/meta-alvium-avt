#FILESEXTRAPATHS:prepend := "${THISDIR}/../avt-csi2-3/files/:${THISDIR}/${PN}/files:"
FILESEXTRAPATHS:prepend := "${THISDIR}/${PN}/files/v2022.1:${THISDIR}/${PN}/files:"
#${THISDIR}/../avt-csi2-3/files/:${THISDIR}/../ds90ub95xq1/files/:
#rev=<revision>;subdir=second_repo

require recipes-kernel/linux/linux-avt-common.inc

SRC_URI += " \
	file://drm_misc.cfg \
	file://sensors.cfg \
	file://0001-xilinx-dma-Disabled-userptr-streaming.patch \
	file://0002-v4l2-xilinx-Add-Allied-Vision-GenICam-for-CSI2-forma.patch \ 
	"
