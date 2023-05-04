SUMMARY = "Allied Vision imx8mp board configuration utility"
LICENSE = "CLOSED"

SRC_URI = "file://avt-board-config"

RDEPENDS:${PN} += "bash"

S = "${WORKDIR}"

do_install() {
    install -d ${D}${bindir}
    install -m 755 ${S}/avt-board-config ${D}${bindir}/avt-board-config
}

