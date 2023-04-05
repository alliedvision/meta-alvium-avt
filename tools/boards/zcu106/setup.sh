#!/bin/bash

echo "Setup for Xilinx ZCU106"

echo "Build dir ${BUILD_DIR}"

MACHINE="zcu106-zynqmp"
DISTRO="poky"

if [ ${FULL_SETUP} -eq 1 ]; then
    mkdir -p  ${BUILD_DIR}/conf
    touch ${BUILD_DIR}/conf/local.conf

    cat >> ${BUILD_DIR}/conf/bblayers.conf <<EOL
# POKY_BBLAYERS_CONF_VERSION is increased each time build/conf/bblayers.conf
# changes incompatibly
POKY_BBLAYERS_CONF_VERSION = "2"

BSPDIR := "\${@os.path.abspath(os.path.dirname(d.getVar('FILE', True)) + '/$(realpath --relative-to=${BUILD_DIR}/conf ${BSP_DIR})')}"

BBPATH = "\${TOPDIR}"
BBFILES ?= ""

BBLAYERS ?= " \
  \${BSPDIR}/sources/poky/meta \\
  \${BSPDIR}/sources/poky/meta-poky \\
  \${BSPDIR}/sources/poky/meta-yocto-bsp \\
  \${BSPDIR}/sources/meta-openembedded/meta-oe \\
  \${BSPDIR}/sources/meta-openembedded/meta-python \\
  \${BSPDIR}/sources/meta-openembedded/meta-networking \\
  \${BSPDIR}/sources/meta-openembedded/meta-multimedia \\
  \${BSPDIR}/sources/meta-qt5 \\
  \${BSPDIR}/sources/meta-xilinx/meta-xilinx-bsp \\
  \${BSPDIR}/sources/meta-xilinx/meta-xilinx-core \\
  \${BSPDIR}/sources/meta-xilinx/meta-xilinx-standalone \\
  \${BSPDIR}/sources/meta-xilinx/meta-xilinx-pynq \\
  \${BSPDIR}/sources/meta-xilinx-tools \\
  "
EOL

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