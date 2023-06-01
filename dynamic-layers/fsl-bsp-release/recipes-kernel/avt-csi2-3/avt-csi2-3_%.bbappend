
do_install:append() {
    echo "softdep imx8_media_dev pre: avt_csi2-3" >  ${D}${sysconfdir}/modprobe.d/imx8_media_dev.conf
}

FILES:${PN} += "${sysconfdir}/modprobe.d/imx8_media_dev.conf"