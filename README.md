meta-alvium-avt
=================

This layer provides support for Alvium MIPI-CSI2 cameras on NXP i.MX8MP and Xilinx ZynqMP.

THE SOFTWARE IS PRELIMINARY AND STILL IN TESTING AND VERIFICATION PHASE AND IS PROVIDED ON AN “AS IS” AND “AS AVAILABLE” BASIS AND IS BELIEVED TO CONTAIN DEFECTS. A PRIMARY PURPOSE OF THIS EARLY ACCESS IS TO OBTAIN FEEDBACK ON PERFORMANCE AND THE IDENTIFICATION OF DEFECT SOFTWARE, HARDWARE AND DOCUMENTATION.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.

Maintainers, Mailing list, Patches
==================================

For any patches or pull requests please use the Github pull requests.
For comments or questions about this layer, please create an issue.


Maintainers:

	Dennis Langenkamp <dennis.langenkamp@alliedvision.com>
	Florian Kesseler <florian.kesseler@alliedvision.com>

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

i.MX8MP-EVK quick start guide
===============================

## Prerequisites
-  i.MX 8M Plus EVK
-  Host PC: See NXP's requirements for i.MX Yocto Project BSP Rev. 5.15.52-2.1.0 in the [i.MX Yocto Project User's Guide](https://www.nxp.com/docs/en/user-guide/IMX_YOCTO_PROJECT_USERS_GUIDE.pdf)
-  Alvium camera with Firmware 11.1
-  SD Card 8 GB

## Installation

Tip: For the prebake image, skip steps 1-5 and start with step 6.

To install the driver and layer:

1. Set up the Yocto Project following the instructions of the i.MX Yocto Project User's Guide.
2. Checkout the following AVT meta layers:
	- [meta-alvium-avt](https://github.com/alliedvision/meta-alvium-avt) (this repository)
	- [meta-imx-avt](https://github.com/alliedvision/meta-imx-avt)
3. Add the AVT layers with the commands:
   ```shell
   bitbake-layers add-layer <path_to_meta-alvium-avt>  
   bitbake-layers add-layer <path_to_meta-imx-avt>
   ```
4. Copy the example configuration from meta-alvium-avt with the following command:
   ```shell
   cp <path_to_meta-alvium-avt>/build_imx8mp_evk_example/conf/local.conf <build_dir>/conf/local.conf
   ```
5. Build the AVT Image with the command:  
   ```shell
   bitbake avs-image-alvium-validation
   ```
6. Flash the image to the SD card.  If you have build the image with yocto, you can find the image here:
   <build_dir>/tmp/deploy/images/imx8mpevk/avs-image-alvium-validation-imx8mpevk.rootfs.wic.bz2
7. Boot the board.
8. Check if the camera firmware version is 11.1 or higher. If the camera has an earlier firmware, perform an update with Vimba Firmware Updater.

Tip: By default, the camera is listed as /video3 or /video4, depending on the port.

## How to start a stream

cat  /sys/bus/i2c/devices/1-003c/device_temperature

e.g. for Alvium 1500 C-500c on Port CSI1 of imx8mp-evk:

```shell
v4l2-ctl -d /dev/v4l-subdev2 --set-ctrl exposure=20000000,gain=100,brightness=0 --set-crop top=0,left=0,width=1920,height=1080
gst-launch-1.0 v4l2src device=/dev/video3 ! video/x-raw,width=1920,height=1080,framerate=30/1,io-mode=dmabuf ! waylandsink sync=false -v
```

ZCU106 quick start guide
===============================

## Prerequisites
-  Xilinx ZCU106
-  Host PC: Install the requirements for yocto honister as stated in the [Yocto Project Reference Manual](https://docs.yoctoproject.org/3.4.4/ref-manual/system-requirements.html?highlight=requirements)
-  Alvium camera with Firmware 11.1
-  SD Card 8 GB

## Installation

Tip: For the prebake image, skip steps 1-5 and start with step 6.

To install the driver and layer:

1. Checkout dependencies:
    ```shell
    git clone -b honister https://github.com/yoctoproject/poky.git poky/
    git clone -b honister https://github.com/openembedded/meta-openembedded.git  meta/meta-openembedded
    git clone -b honister https://github.com/meta-qt5/meta-qt5.git meta/meta-qt5
    git clone -b rel-v2022.2 https://github.com/Xilinx/meta-xilinx.git meta/meta-xilinx_2022.2
    git clone -b rel-v2022.2 https://github.com/Xilinx/meta-xilinx-tools.git meta/meta-xilinx-tools_2022.2
    ```
2. Init yocto build environment:
    ```shell
    source poky/oe-init-build-env build/
    ```
3. Add yocto meta layers:
    ```shell
    bitbake-layers add-layer ../meta/meta-openembedded/meta-oe 
    bitbake-layers add-layer ../meta/meta-openembedded/meta-python 
    bitbake-layers add-layer ../meta/meta-openembedded/meta-networking 
    bitbake-layers add-layer ../meta/meta-openembedded/meta-multimedia 
    bitbake-layers add-layer ../meta/meta-qt5 
    bitbake-layers add-layer ../meta/meta-xilinx_2022.2/meta-xilinx-bsp 
    bitbake-layers add-layer ../meta/meta-xilinx_2022.2/meta-xilinx-core 
    bitbake-layers add-layer ../meta/meta-xilinx_2022.2/meta-xilinx-standalone 
    bitbake-layers add-layer ../meta/meta-xilinx_2022.2/meta-xilinx-pynq 
    bitbake-layers add-layer ../meta/meta-xilinx-tools_2022.2 
    ```
4. Checkout the following AVT meta layers:
    - [meta-alvium-avt](https://github.com/alliedvision/meta-alvium-avt) (this repository)
    - [meta-imx-avt](https://github.com/alliedvision/meta-imx-avt)
5. Add the AVT layers with the commands:
    ```shell
    bitbake-layers add-layer <path_to_meta-alvium-avt>  
    bitbake-layers add-layer <path_to_meta-imx-avt>
    ```
6. Copy the example configuration from meta-alvium-avt with the following command:
    ```shell
      cp <path_to_meta-alvium-avt>/build_imx8mp_evk_example/conf/local.conf <build_dir>/conf/local.conf
    ```
7. Build the AVT Image with the command:
     ```shell
      bitbake avs-image-alvium-validation
    ```
8. Flash the image to the SD card. If you have build the image with yocto, you can find the image here:
   <build_dir>/tmp/deploy/images/zcu106-zynqmp/avs-image-alvium-validation-zcu106-zynqmp.wic.bz2
9. Boot the board.
10. Check if the camera firmware version is 11.1 or higher. If the camera has an earlier firmware, perform an update with Vimba Firmware Updater.

## How to start a stream
e.g. for Alvium 1500 C-500c on Port 0 of ZCU106:
```shell
export XDG_RUNTIME_DIR=/run/user/0/
export QT_QPA_PLATFORM=wayland
export QT_WAYLAND_SHELL_INTEGRATION=wl-shell

media-ctl -d 0 -v -V  '"avt3 2-003c":0 [fmt:UYVY8_1X16/1920x1080@1000/20000 field:none colorspace:srgb xfer:srgb ycbcr:601 quantization:full-range]'

media-ctl -d 0 -v -V  '"a0000000.mipi_csi2_rx_subsystem":1 [fmt:UYVY8_1X16/1920x1080]'

v4l2-ctl -d /dev/v4l-subdev1 --set-ctrl exposure=20000000,gain=100,brightness=0 --set-crop top=0,left=0,width=1920,height=1080
gst-launch-1.0 v4l2src device=/dev/video0 ! video/x-raw,width=1920,height=1080,framerate=30/1,io-mode=dmabuf ! waylandsink sync=false -v
```


