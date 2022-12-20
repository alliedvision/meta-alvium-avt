FILESEXTRAPATHS:prepend := "${THISDIR}/files:"

SRC_URI += " file://qpa_platform_wayland.sh "

PACKAGECONFIG:remove:zynqmp = "xcomposite-egl xcomposite-glx"

do_install:append() {
    install -d ${D}${sysconfdir}/profile.d/
    install -m 0755 ${WORKDIR}/qpa_platform_wayland.sh ${D}${sysconfdir}/profile.d/
}