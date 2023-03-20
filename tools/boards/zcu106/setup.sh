#!/bin/bash

echo "Setup for Xilinx ZCU106"

echo "Build dir ${BUILD_DIR}"

MACHINE="zcu106-zynqmp"
DISTRO="poky"

source sources/poky/oe-init-build-env ${BUILD_DIR}

function add_layer() {
    if [ -d "${BSP_DIR}/sources/$1" ]; then

    if [ -z $(grep "$1" ${BBLAYERS_FILE}) ]; then
            echo "BBLAYERS += \"\${BSPDIR}/sources/$1\"" >> ${BBLAYERS_FILE}
        fi
    else
        echo "Warning: $1 not found! Some feature may not be available!"
    fi
}

if [ ${FULL_SETUP} -eq 1 ]; then

    BUILD_DIR=.

    add_layer "meta-openembedded/meta-oe"
    add_layer "meta-openembedded/meta-python"
    add_layer "meta-openembedded/meta-networking"
    add_layer "meta-openembedded/meta-multimedia"
    add_layer "meta-xilinx_2022.2/meta-xilinx-bsp"
    add_layer "meta-xilinx_2022.2/meta-xilinx-core"
    add_layer "meta-xilinx_2022.2/meta-xilinx-standalone"
    add_layer "meta-xilinx_2022.2/meta-xilinx-pynq"
    add_layer "meta-xilinx-tools_2022.2"
fi