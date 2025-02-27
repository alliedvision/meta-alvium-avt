
do_install:append:use-nxp-bsp() {
    install -d -m 755 ${D}${sysconfdir}/modprobe.d
    echo "softdep imx8_media_dev pre: avt_csi2" >  ${D}${sysconfdir}/modprobe.d/imx8_media_dev.conf
}

FILES:${PN}:append:use-nxp-bsp = "${sysconfdir}/modprobe.d/imx8_media_dev.conf"