#!/bin/bash

IMX_BSP_DIR=${BSP_DIR}/imx-bsp

echo "Setup for i.MX8M Plus EVK"

echo "Build dir ${BUILD_DIR}"

cd ${IMX_BSP_DIR}

MACHINE="imx8mpevk"
DISTRO="fsl-imx-xwayland"

IMX_BUILD_DIR=$(realpath --relative-to=${PWD} ${BUILD_DIR})

if [ ${FULL_SETUP} -eq 1 ]; then
    if [ ${ACCEPT_LICENSES} -eq 1 ]; then
        EULA=1
    fi

    source imx-setup-release.sh -b ${IMX_BUILD_DIR}

    BUILD_DIR=.

    if [ ! -f conf/bblayers.conf.imx ]; then
        cp conf/bblayers.conf conf/bblayers.conf.imx
    fi

    sed -i 's/${BSPDIR}\/sources/${BSPDIR}\/imx-bsp\/sources/g' conf/bblayers.conf

    if [ -d "${BSP_DIR}/sources/meta-imx-avt" ]; then

        if [ -z $(grep "meta-imx-avt" ${BBLAYERS_FILE}) ]; then
            echo "BBLAYERS += \"\${BSPDIR}/sources/meta-imx-avt\"" >> ${BBLAYERS_FILE}
        fi
    else
        echo "Warning: meta-imx-avt not found! Some feature may not be available!"
    fi
else
    source setup-environment ${IMX_BUILD_DIR}
fi
