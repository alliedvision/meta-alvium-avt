SUMMARY = "A very basic Wayland image with a terminal and some v4l2 tools to test the alvium v4l2 driver"
DESCRIPTION = "A weston minimal v4l2 demo image for Testing."

IMAGE_FEATURES += "splash package-management ssh-server-dropbear hwcodecs weston"
IMAGE_FEATURES += "ssh-server-openssh "

LICENSE = "MIT"

inherit core-image

QB_MEM = "-m 512"

IMAGE_LINGUAS ?= " "

inherit core-image features_check
#distro_features_check
# extrausers

export IMAGE_BASENAME = "avs-image-alvium-validation-xlnx"

REQUIRED_DISTRO_FEATURES += "wayland"

CORE_IMAGE_BASE_INSTALL += "packagegroup-core-weston"

CORE_IMAGE_BASE_INSTALL += "weston weston-init weston-examples gtk+3-demo"
CORE_IMAGE_BASE_INSTALL += "${@bb.utils.contains('DISTRO_FEATURES', 'x11', 'weston-xwayland matchbox-terminal', '', d)}"

CORE_IMAGE_EXTRA_INSTALL += " \
			tree traceroute nano hexedit \
			tzdata ntimed rng-tools openssl \
			i2c-tools devmem2 mc htop \
			e2fsprogs \
			dtc \
			tinymembench \
			iputils usbutils \
			iproute2 htop \
			curl lldpd \
			"
CORE_IMAGE_EXTRA_INSTALL += " qtwayland "
CORE_IMAGE_EXTRA_INSTALL += " avt-csi2-3 "
CORE_IMAGE_EXTRA_INSTALL += " v4l-utils "
CORE_IMAGE_EXTRA_INSTALL += " v4l2viewer "
CORE_IMAGE_EXTRA_INSTALL += " htop lsof "
#CORE_IMAGE_EXTRA_INSTALL += " yuview yuview-tools yuview-plugins "
CORE_IMAGE_BASE_INSTALL += "${@bb.utils.contains('DISTRO_FEATURES', 'qt5', 'yuview yuview-tools yuview-plugins', '', d)}"
CORE_EXTRA_IMAGE_INSTALL += " python3-configargparse "


CORE_IMAGE_EXTRA_INSTALL += " ttf-ubuntu-mono ttf-ubuntu-sans "
CORE_IMAGE_EXTRA_INSTALL += " ttf-liberation-mono ttf-liberation-sans ttf-liberation-serif"
CORE_IMAGE_EXTRA_INSTALL += " libsdl2-ttf libsdl-ttf "
CORE_IMAGE_EXTRA_INSTALL += " ttf-dejavu-sans"
CORE_IMAGE_EXTRA_INSTALL += " ttf-dejavu-sans-mono "
CORE_IMAGE_EXTRA_INSTALL += " ttf-dejavu-sans-condensed "
CORE_IMAGE_EXTRA_INSTALL += " ttf-dejavu-serif "
CORE_IMAGE_EXTRA_INSTALL += " ttf-dejavu-serif-condensed"
CORE_IMAGE_EXTRA_INSTALL += " ttf-dejavu-mathtexgyre"
CORE_IMAGE_EXTRA_INSTALL += " ttf-dejavu-common"
CORE_IMAGE_EXTRA_INSTALL += " python3-spidev gstreamer1.0-python "
CORE_IMAGE_EXTRA_INSTALL += " opencv "
CORE_IMAGE_EXTRA_INSTALL += " \
				kernel-modules \
				ndisc6 \
				libdrm \
				libdrm-kms \
				libmali-xlnx \
				libdrm-tests \
				gstreamer1.0 \
				gstreamer1.0-plugins-base \
				gstreamer1.0-plugins-good \
				gstreamer1.0-plugins-bad \
				gstreamer1.0-plugins-ugly \
				gstreamer1.0-libav  \
				graphviz \
				tzdata ntimed \
				qsiv \
				gst-instruments \
				"

MACHINE_ESSENTIAL_EXTRA_RRECOMMENDS += "kernel-modules"

LICENSE_FLAGS_ACCEPTED += "commercial_pmu-rom-native"
LICENSE_FLAGS_ACCEPTED += "xilinx_pmu-rom-native"

PACKAGECONFIG_pn-kmscube += " gstreamer "
PACKAGECONFIG_pn-kmscube-master += " gstreamer "

PACKAGECONFIG_pn-weston:append = " xwayland screenshare shell-desktop image-jpeg "
PACKAGECONFIG_pn-v4l-utils:append = " qv4l2 "
PREFERRED_VERSION:v4l-utils = "1.23%"
