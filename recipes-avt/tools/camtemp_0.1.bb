LICENSE = "MIT"
LIC_FILES_CHKSUM = "file://${COREBASE}/meta/COPYING.MIT;md5=3da9cfbcb788c80a0384361b4de20420"

FILESEXTRAPATHS:prepend := "${THISDIR}/files:"

RDEPENDS_${PN} += "bash"

SRC_URI = " \
        file://MIT-LICENSE.txt \
        file://cam_temp.sh \
        "

do_install:append() {
    install -d ${D}${bindir}
    install -Dm0755 ${WORKDIR}/cam_temp.sh ${D}${bindir}

}

FILES_${PN} += "${bindir}/*"
