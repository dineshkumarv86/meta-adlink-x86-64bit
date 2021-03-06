DESCRIPTION = "Adlink Production Image with Sato support that includes everything within \
core-image-sato plus meta-toolchain, development headers and libraries to \
form a standalone SDK."
SUMMARY = "A small image just capable of allowing a device to boot."

IMAGE_INSTALL = "packagegroup-core-boot ${CORE_IMAGE_EXTRA_INSTALL}"

LICENSE = "MIT"

inherit core-image

REQUIRED_DISTRO_FEATURES = "x11"

IMAGE_ROOTFS_SIZE ?= "8192"
IMAGE_ROOTFS_EXTRA_SPACE_append = "${@bb.utils.contains("DISTRO_FEATURES", "systemd", " + 4096", "" ,d)}"

## SEMA applications
IMAGE_INSTALL_append = " sema4.0 startupconfig"


#Tools
IMAGE_INSTALL_append = " lshw ntp ntpdate libstdc++ git wget which busybox bzip2 cmake bash tar gzip kmod ethtool i2c-tools ifupdown inetutils init-ifupdown iw minicom net-tools vim openssh kernel-modules "

export IMAGE_BASENAME = "adlink-mini-x86"
