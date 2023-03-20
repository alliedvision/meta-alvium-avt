#!/bin/bash

echo "Setup for Xilinx ZCU106"

echo "Build dir ${BUILD_DIR}"

MACHINE="zcu106-zynqmp"
DISTRO="poky"

if [ ${FULL_SETUP} -eq 1 ]; then
    mkdir -p  ${BUILD_DIR}/conf
    touch ${BUILD_DIR}/conf/local.conf

    cat >> ${BUILD_DIR}/conf/local.conf <<EOL
CONF_VERSION = "2"
EXTRA_IMAGE_FEATURES = "debug-tweaks"
USER_CLASSES ?= "buildstats"

PATCHRESOLVE = "noop"

BB_DISKMON_DIRS ??= "\\
    STOPTASKS,${TMPDIR},1G,100K \\
    STOPTASKS,${DL_DIR},1G,100K \\
    STOPTASKS,${SSTATE_DIR},1G,100K \\
    STOPTASKS,/tmp,100M,100K \\
    ABORT,${TMPDIR},100M,1K \\
    ABORT,${DL_DIR},100M,1K \\
    ABORT,${SSTATE_DIR},100M,1K \\
    ABORT,/tmp,10M,1K"

BB_SERVER_TIMEOUT = "300"

BB_DANGLINGAPPENDS_WARNONLY = "true"

USER_CLASSES ?= "buildstats"

MACHINE = "zcu106-zynqmp"

DISTRO = "poky"
PACKAGE_CLASSES = "package_deb"
EOL

fi

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
    add_layer "meta-xilinx/meta-xilinx-bsp"
    add_layer "meta-xilinx/meta-xilinx-core"
    add_layer "meta-xilinx/meta-xilinx-standalone"
    add_layer "meta-xilinx/meta-xilinx-pynq"
    add_layer "meta-xilinx-tools"
fi