FILESEXTRAPATHS:prepend := "${THISDIR}/${PN}/imx:${THISDIR}/5.15:${THISDIR}/files:${THISDIR}/../avt-csi2-3/files/:${THISDIR}/../ds90ub95xq1/files/:"

#$${THISDIR}/${PN}/files:${THISDIR}/${PN}/msc:${THISDIR}/${PV}:${THISDIR}/${LINUX_VERSION}:"

SRC_URI += " \ 
	file://libcsi_ioctl.h;subdir=git/include/uapi/linux/ \	
    file://mipi-csi2.h;subdir=git/include/media \
	file://alvium_kernel_mod.cfg \
	file://iio_ina.cfg \
	file://pwm_led.cfg \
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

#SRC_URI:imx8mqevk += " \
#	file://imx8mq-evk-alvium.dts;subdir=git/arch/arm64/boot/dts/freescale \
#	"

#	file://0001_temp_imx8-mipi-csi2-sam_streamon.patch \
#
#SRC_URI:imx8mpevk += " \ 
#	file://mipi_timing.h;subdir=git/arch/arm64/boot/dts/freescale \
#	file://imx8mp-evk-alvium.dts;subdir=git/arch/arm64/boot/dts/freescale \
#	file://0001_imx8mpevk_avt_sensor_and_ina260_dts.patch \
#	file://0001_imx8-isi-cap_ignore_pix-width_ISI_4K.patch \
#	"
##
##
##	file://0002_mx6s_capture_check_fmt_pointer.patch \
##SRC_URI:imx8mpevk += " \
##	file://0001_imx8-mipi-csi2-sam_mipi_timing.patch \
##	file://0002_imx8-mipi-csi2-sam_mipi_timing.patch \
##	file://0003_imx8-mipi-csi2-sam_mipi_timing.patch \
##	file://imx8_csi_module.cfg \
##	"
##
#####SRC_URI:sm2s-imx8mp += " \
#####	file://0001_imx8-isi-cap_ignore_pix-width_ISI_4K.patch \
#####	file://0001_imx8-mipi-csi2-sam_mipi_timing.patch \
#####	file://0002_imx8-mipi-csi2-sam_mipi_timing.patch \
#####	file://0003_imx8-mipi-csi2-sam_mipi_timing.patch \
#####	file://imx8_csi_module.cfg \
#####	"
######
####### Mask MSC linux-imx_5.10.bbappend!!
####### BBMASK += " /mnt/data_nvme2/projects/allied_vision/avnet-embedded/sources/meta-avnet-embedded-bsp/dynamic-layers/meta-imx/recipes-kernel/linux/linux-imx_5.10.bbappend "
######
#####SRC_URI:sm2s-imx8mp += " \
#####	file://msc/Makefile;subdir=git/arch/${ARCH}/boot/dts/ \
#####	file://msc/imx8mp/Makefile;subdir=git/arch/${ARCH}/boot/dts/ \
#####	file://msc/imx8mp/msc-sm2s-imx8mp-001-module.dts;subdir=git/arch/${ARCH}/boot/dts/ \
#####	file://msc/imx8mp/msc-sm2s-imx8mp-002-module.dts;subdir=git/arch/${ARCH}/boot/dts/ \
#####	file://msc/imx8mp/msc-sm2s-imx8mp-003-module.dts;subdir=git/arch/${ARCH}/boot/dts/ \
#####	file://msc/imx8mp/msc-sm2s-imx8mp-004-module.dts;subdir=git/arch/${ARCH}/boot/dts/ \
#####	file://msc/imx8mp/msc-sm2s-imx8mp-005-module.dts;subdir=git/arch/${ARCH}/boot/dts/ \
#####	file://msc/imx8mp/msc-sm2s-imx8mp-03N0E10I-module.dts;subdir=git/arch/${ARCH}/boot/dts/ \
#####	file://msc/imx8mp/msc-sm2s-imx8mp-14N0700I-module.dts;subdir=git/arch/${ARCH}/boot/dts/ \
#####	file://msc/imx8mp/msc-sm2s-imx8mp-14N0740I-module.dts;subdir=git/arch/${ARCH}/boot/dts/ \
#####	file://msc/imx8mp/msc-sm2s-imx8mp-24N0600I-module.dts;subdir=git/arch/${ARCH}/boot/dts/ \
#####	file://msc/imx8mp/msc-sm2s-imx8mp-24N0680I-module.dts;subdir=git/arch/${ARCH}/boot/dts/ \
#####	file://msc/imx8mp/msc-sm2s-imx8mp6-14N0600E-module.dts;subdir=git/arch/${ARCH}/boot/dts/ \
#####	file://msc/imx8mp/msc-sm2s-imx8mp6-14N0E00I-module.dts;subdir=git/arch/${ARCH}/boot/dts/ \
#####	file://msc/imx8mp/msc-sm2s-imx8mp-dv1-module.dtsi;subdir=git/arch/${ARCH}/boot/dts/ \
#####	file://msc/imx8mp/msc-sm2s-imx8mp-dv2-module.dtsi;subdir=git/arch/${ARCH}/boot/dts/ \
#####	file://msc/imx8mp/msc-sm2s-imx8mp-flexcan.dtsi;subdir=git/arch/${ARCH}/boot/dts/ \
#####	file://msc/imx8mp/msc-sm2s-imx8mp-module.dtsi;subdir=git/arch/${ARCH}/boot/dts/ \
#####	file://msc/imx8mp/msc-sm2s-imx8mp-wifi.dtsi;subdir=git/arch/${ARCH}/boot/dts/ \
#####	file://msc/imx8mp/overlay-baseboard-ep1.dts;subdir=git/arch/${ARCH}/boot/dts/ \
#####	file://msc/imx8mp/overlay-baseboard-ep5.dts;subdir=git/arch/${ARCH}/boot/dts/ \
#####	file://msc/imx8mp/overlay-baseboard-vebo.dts;subdir=git/arch/${ARCH}/boot/dts/ \
#####	file://msc/imx8mp/overlay-cam0-ov5640.dts;subdir=git/arch/${ARCH}/boot/dts/ \
#####	file://msc/imx8mp/overlay-cam1-ov5640.dts;subdir=git/arch/${ARCH}/boot/dts/ \
#####	file://msc/imx8mp/overlay-dsi-rm67191.dts;subdir=git/arch/${ARCH}/boot/dts/ \
#####	file://msc/imx8mp/overlay-hdmi.dts;subdir=git/arch/${ARCH}/boot/dts/ \
#####	file://msc/imx8mp/overlay-lvds0-ama-070a04.dts;subdir=git/arch/${ARCH}/boot/dts/ \
#####	file://msc/imx8mp/overlay-lvds0-ama-101a01.dts;subdir=git/arch/${ARCH}/boot/dts/ \
#####	file://msc/imx8mp/overlay-lvds0-ama-121a01.dts;subdir=git/arch/${ARCH}/boot/dts/ \
#####	file://msc/imx8mp/overlay-lvds0-auo-p215hvn01.dts;subdir=git/arch/${ARCH}/boot/dts/ \
#####	file://msc/imx8mp/overlay-lvds1-ama-070a04.dts;subdir=git/arch/${ARCH}/boot/dts/ \
#####	file://msc/imx8mp/overlay-lvds1-ama-101a01.dts;subdir=git/arch/${ARCH}/boot/dts/ \
#####	file://msc/imx8mp/overlay-lvds1-ama-121a01.dts;subdir=git/arch/${ARCH}/boot/dts/ \
#####	file://msc/imx8mp/industrial-temp-grade.dtsi;subdir=git/arch/${ARCH}/boot/dts/ \
#####	file://snvs_pwrkey.c;subdir=git/drivers/input/keyboard/ \
#####	file://snvs_pwrkey.h;subdir=git/include/dt-bindings/input/ \
#####	file://msc_ep5.cfg \
#####	"
#####
#####SRC_URI:sm2s-imx8mp += " \
#####	file://overlay-cam0-alvium.dts;subdir=git/arch/${ARCH}/boot/dts/msc/imx8mp/ \
#####	file://overlay-cam1-alvium.dts;subdir=git/arch/${ARCH}/boot/dts/msc/imx8mp/ \
#####	file://overlay-cam0-alvium_300.dts;subdir=git/arch/${ARCH}/boot/dts/msc/imx8mp/ \
#####	file://overlay-cam1-alvium_300.dts;subdir=git/arch/${ARCH}/boot/dts/msc/imx8mp/ \
#####	file://overlay-cam0-alvium_400.dts;subdir=git/arch/${ARCH}/boot/dts/msc/imx8mp/ \
#####	file://overlay-cam1-alvium_400.dts;subdir=git/arch/${ARCH}/boot/dts/msc/imx8mp/ \
#####	file://overlay-cam0-alvium_500.dts;subdir=git/arch/${ARCH}/boot/dts/msc/imx8mp/ \
#####	file://overlay-cam1-alvium_500.dts;subdir=git/arch/${ARCH}/boot/dts/msc/imx8mp/ \
#####	file://overlay-cam0-alvium_750.dts;subdir=git/arch/${ARCH}/boot/dts/msc/imx8mp/ \
#####	file://overlay-cam1-alvium_750.dts;subdir=git/arch/${ARCH}/boot/dts/msc/imx8mp/ \
#####	file://mipi_timing.h;subdir=git/include/dt-bindings/clock/ \
#####	"
##
###SRC_URI:sm2s-imx8mp += " \
###	file://0001_add_msc_dtb_Makefiles.patch \
###	"
##
############################################################################

#KERNEL_DEVICETREE:imx8mpevk:append = " \
#	freescale/imx8mp-evk-alvium.dtb \
#	"

KERNEL_DEVICETREE:append:imx8mpevk = " \
	freescale/imx8mp-evk-alvium.dtb \
	freescale/imx8mp-evk-alvium-fpdlink.dtb \
	"


KERNEL_DEVICETREE:append:imx8mqevk = " \
	freescale/imx8mq-evk-alvium.dtb \
	"


#####KERNEL_DEVICETREE:sm2s-imx8mp += " \
#####		msc/imx8mp/overlay-cam0-alvium.dtb \
#####		msc/imx8mp/overlay-cam1-alvium.dtb \
#####		msc/imx8mp/overlay-cam0-alvium_300.dtb \
#####		msc/imx8mp/overlay-cam1-alvium_300.dtb \
#####		msc/imx8mp/overlay-cam0-alvium_400.dtb \
#####		msc/imx8mp/overlay-cam1-alvium_400.dtb \
#####		msc/imx8mp/overlay-cam0-alvium_500.dtb \
#####		msc/imx8mp/overlay-cam1-alvium_500.dtb \
#####		msc/imx8mp/overlay-cam0-alvium_750.dtb \
#####		msc/imx8mp/overlay-cam1-alvium_750.dtb \
#####		"
##
#####KERNEL_DEVICETREE:remove:use-nxp-bsp = " \
#####	freescale/imx8mp-evk-dsp.dtb \
#####	freescale/imx8mp-evk-dsp-lpa.dtb \
#####	"
##
DELTA_KERNEL_DEFCONFIG:imx8mpevk += "iio_ina.cfg "
#DELTA_KERNEL_DEFCONFIG:imx8mpevk += "pwm_led.cfg "
DELTA_KERNEL_DEFCONFIG:imx8mpevk += "alvium_kernel_mod.cfg "
DELTA_KERNEL_DEFCONFIG:imx8mpevk += "adv_v4l_dbg.cfg"
###DELTA_KERNEL_DEFCONFIG_append_imx8mpevk = "imx8_csi_module.cfg"
#DELTA_KERNEL_DEFCONFIG:imx8mpevk += " ds90ub95x_kernel_mod.cfg "

###
DELTA_KERNEL_DEFCONFIG:imx8mqevk += "iio_ina.cfg "
#DELTA_KERNEL_DEFCONFIG:imx8mqevk += "pwm_led.cfg "
DELTA_KERNEL_DEFCONFIG:imx8mqevk += "alvium_kernel_mod.cfg "
DELTA_KERNEL_DEFCONFIG:imx8mqevk += "adv_v4l_dbg.cfg"
##DELTA_KERNEL_DEFCONFIG_imx8mqevk += "imx8_csi_module.cfg"
##
###KERNEL_MODULE_AUTOLOAD += "pwm-tlc59711"
###KERNEL_MODULE_AUTOLOAD += "pwm-tlc5947"
KERNEL_MODULE_AUTOLOAD += "avt-csi2-3"
KERNEL_MODULE_AUTOLOAD += "ina260-adc"
##
###
#####https://source.codeaurora.org/external/imx/imx-manifest/tree/README?h=imx-linux-hardknott
###
##
##EXTRA_OEMAKE_mx8mp += " DTC_FLAGS=-@ "
##
