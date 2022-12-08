SUMMARY = "Allied Vision Alvium external Linux kernel module"
LICENSE = "GPLv2"
LIC_FILES_CHKSUM = "file://COPYING;md5=12f884d2ae1ff87c09e5b7ccc2c4ca7e"

PR = "r0"
#PV = "0.1"

AVT_GIT_REPO = "alvium-csi2-driver"
AVT_GIT_BRANCH = "main"
SRCREV = "${AUTOREV}"

#Use ssh instead of https, because the repo is currently private
AVT_GIT_PROTOCOL = "ssh"

require recipes-avt/common/avt_git.inc

S = "${WORKDIR}/git"


do_build() {

}

do_install() {
    mkdir -p ${DEPLOY_DIR_IMAGE}
    cp ${S}/avt-csi2-3-xlnx-helper.tar.gz ${DEPLOY_DIR_IMAGE}
}

#    install -d ${D}${bindir}
#    install -Dm0644 ${WORKDIR}/avt-csi2-3-xlnx-helper.tar.gz ${D}${bindir}

FILES_${PN} += "${bindir}/*"

do_deploy() {
    mkdir -p ${DEPLOY_DIR_IMAGE}
    cp ${S}/avt-csi2-3-xlnx-helper.tar.gz ${DEPLOY_DIR_IMAGE}
}

do_compile() {
    mkdir include/uapi/linux -p
    mkdir drivers/media/i2c -p
    mkdir include/media -p
    mv ${S}/libcsi_ioctl.h include/uapi/linux/
    mv ${S}/avt-csi2-3.c drivers/media/i2c/ 
    mv ${S}/avt-csi2.h drivers/media/i2c/ 
    mv ${S}/avt-csi2-regs.h drivers/media/i2c/ 

    tar -cvzf avt-csi2-3-xlnx-helper.tar.gz drivers include 

#	file://mipi-csi2.h;subdir=git/include/media 

}

