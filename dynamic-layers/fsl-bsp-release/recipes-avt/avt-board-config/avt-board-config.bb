SUMMARY = "Allied Vision imx8mp board configuration utility"
LICENSE = "MIT"
LIC_FILES_CHKSUM = "file://${COMMON_LICENSE_DIR}/MIT;md5=0835ade698e0bcf8506ecda2f7b4f302"

SRC_URI = "file://avt-board-config"

RDEPENDS:${PN} += "bash"

S = "${WORKDIR}"

do_install() {
    install -d ${D}${bindir}
    install -m 755 ${S}/avt-board-config ${D}${bindir}/avt-board-config
}

