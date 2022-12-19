FILESEXTRAPATHS:prepend := "${THISDIR}/5.15:${THISDIR}/files:"

SRC_URI += " \
	file://libcsi_ioctl.h;subdir=git/include/uapi/linux/ \
	file://iio_ina.cfg \
	file://adv_v4l_dbg.cfg \
	"
# to be removed for next lts kernel
SRC_URI += " \
    file://mipi-csi2.h;subdir=git/include/media \
	"
