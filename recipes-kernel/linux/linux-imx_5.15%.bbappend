FILESEXTRAPATHS:prepend := "${THISDIR}/${PN}/imx:${THISDIR}/5.15:${THISDIR}/files:"
#${THISDIR}/../avt-csi2-3/files/:${THISDIR}/../ds90ub95xq1/files/:"

#$${THISDIR}/${PN}/files:${THISDIR}/${PN}/msc:${THISDIR}/${PV}:${THISDIR}/${LINUX_VERSION}:"

SRC_URI += " \ 
	file://libcsi_ioctl.h;subdir=git/include/uapi/linux/ \	
	file://alvium_kernel_mod.cfg \
	file://iio_ina.cfg \
	file://adv_v4l_dbg.cfg \
	"

# to be removed for next lts kernel
SRC_URI += " \ 
    file://mipi-csi2.h;subdir=git/include/media \
	"

SRC_URI:append:imx8mpevk = " \
	file://mipi_timing.h;subdir=git/arch/arm64/boot/dts/freescale \
	file://imx8mp-evk-alvium.dts;subdir=git/arch/arm64/boot/dts/freescale \
	file://imx8mp-evk-alvium-fpdlink.dts;subdir=git/arch/arm64/boot/dts/freescale \
	file://0001_imx8mpevk_avt_sensor_dts_Makefile.patch \
	file://0001_dbg_imx8-isi-hw.patch \
	"

SRC_URI:append:imx8mqevk = " \
	file://mipi_timing.h;subdir=git/arch/arm64/boot/dts/freescale \
	file://imx8mq-evk-alvium.dts;subdir=git/arch/arm64/boot/dts/freescale \
	file://0001_imx8mqevk_avt_sensor_dts_Makefile.patch \
	"

KERNEL_DEVICETREE:append:imx8mqevk = " \
	freescale/imx8mq-evk-alvium.dtb \
	"

DELTA_KERNEL_DEFCONFIG:imx8mpevk += "iio_ina.cfg "
DELTA_KERNEL_DEFCONFIG:imx8mpevk += "alvium_kernel_mod.cfg "
DELTA_KERNEL_DEFCONFIG:imx8mpevk += "adv_v4l_dbg.cfg"

DELTA_KERNEL_DEFCONFIG:imx8mqevk += "iio_ina.cfg "
DELTA_KERNEL_DEFCONFIG:imx8mqevk += "alvium_kernel_mod.cfg "
DELTA_KERNEL_DEFCONFIG:imx8mqevk += "adv_v4l_dbg.cfg"

KERNEL_MODULE_AUTOLOAD += "avt-csi2-3"
KERNEL_MODULE_AUTOLOAD += "ina260-adc"

#####https://source.codeaurora.org/external/imx/imx-manifest/tree/README?h=imx-linux-hardknott
##
##EXTRA_OEMAKE_mx8mp += " DTC_FLAGS=-@ "
##
