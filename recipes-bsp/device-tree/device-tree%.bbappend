FILESEXTRAPATHS:prepend := "${THISDIR}/files:"

SYSTEM_USER_DTSI ?= "system-user.dtsi"

KERNEL_INCLUDE += " ${STAGING_KERNEL_DIR}/include "

SRC_URI += " file://${SYSTEM_USER_DTSI}"

do_configure:append() {
        cp ${WORKDIR}/${SYSTEM_USER_DTSI} ${B}/device-tree
        echo "#include \"${SYSTEM_USER_DTSI}\"" >> ${B}/device-tree/system-top.dts
}
