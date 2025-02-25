
do_install:append:use-nxp-bsp() {
    echo "softdep imx8_media_dev pre: avt_csi2" >  ${D}${sysconfdir}/modprobe.d/imx8_media_dev.conf
}

FILES:${PN} += "${sysconfdir}/modprobe.d/imx8_media_dev.conf"