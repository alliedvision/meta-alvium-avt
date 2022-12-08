FILESEXTRAPATHS:prepend := "${THISDIR}/files:${THISDIR}/xlnx:"


DEPENDS += " virtual/pmu-firmware "
SRC_URI:append = " file://enable_u-boot_env_save_on_mmc1.cfg "


