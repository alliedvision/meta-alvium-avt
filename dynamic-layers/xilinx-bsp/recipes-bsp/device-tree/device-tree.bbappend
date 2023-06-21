FILESEXTRAPATHS:prepend:kria := "${THISDIR}/files:"

SRC_URI:append:kria  = "file://sd-disable-wp.dtsi"

do_configure:append:kria() {
    echo '/include/ "sd-disable-wp.dtsi"' >> ${DT_FILES_PATH}/system-top.dts
}
