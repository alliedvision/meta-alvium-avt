<<<<<<< HEAD
meta-alvium-avt
=======
meta-alvium-avt-honister
>>>>>>> 23aa21c5fa82383ed9d5e94228a68f1ebf7192dd
=================

This layer provides support for Alvium MIPI-CSI2 cameras on NXP i.MX8MP and Xilinx ZynqMP.


Maintainers, Mailing list, Patches
==================================

Please send any patches, pull requests, comments or questions for this layer to
<<<<<<< HEAD
email address martin.hecht@avnet.eu with ['meta-alvium-avt'] in the subject.
=======
email address martin.hecht@avnet.eu with ['meta-alvium'] in the subject.
>>>>>>> 23aa21c5fa82383ed9d5e94228a68f1ebf7192dd


Maintainers:

	Martin Hecht <martin.hecht@avnet.eu>

Dependencies
============

This layer depends on:
 - meta-oe
 - meta-poky
 - meta-multimedia
 - meta-python
 - meta-gnome
 - meta-networking
 - meta-filesystems
 - meta-qt5 (need to migrate to qt6)
 - meta-python2

 - Layers from NXP:
	- meta-freescale
	- meta-freescale-3rdparty
	- meta-freescale-distro
	- meta-bsp
	- meta-sdk
	- meta-ml
	- meta-v2x
	- meta-nxp-demo-experience  /media/martin/20210810/allied_vision/imx-yocto-bsp/sources/meta-nxp-demo-experience  7


 - Layers from Xilinx:
	- meta-xilinx
	- meta-xilinx-bsp
	- meta-xilinx-tools
	- meta-bsp

Layer dependencies
=====================

URI: git://git.openembedded.org/bitbake

URI: git://git.openembedded.org/openembedded-core

URI: https://git.openembedded.org/meta-openembedded
  meta-openembedded/meta-oe \
  meta-openembedded/meta-multimedia \
  meta-openembedded/meta-python \

URI: git://github.com/meta-qt5/meta-qt5.git

ToDo: complete dependencies

How to start with the cameras on i.MX8MP-EVK
=====================

<<<<<<< HEAD
cat  /sys/bus/i2c/devices/1-003c/device_temperature

e.g. for Alvium 1500c500c on Port CSI1 of imx8mp-evk:

v4l2-ctl -d /dev/v4l-subdev2 --set-ctrl exposure=20000000,gain=100,brightness=0 --set-crop top=0,left=0,width=1920,height=1080
gst-launch-1.0 v4l2src device=/dev/video3 ! video/x-raw,width=1920,height=1080,framerate=30/1,io-mode=dmabuf ! waylandsink sync=false -v
=======
change devicetree to imx8mp-evk-alvium.dtb

cat  /sys/bus/i2c/devices/1-003c/device_temperature

e.g. for Alvium 1800c040c on Port CSI1 of imx8mp-evk:
gst-launch-1.0 v4l2src device=/dev/video3 ! video/x-raw,format=YUY2,width=720,height=480,framerate='(fraction)30/1' ! waylandsink
>>>>>>> 23aa21c5fa82383ed9d5e94228a68f1ebf7192dd




