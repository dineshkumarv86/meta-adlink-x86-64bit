FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}:"
SRC_URI_append = " file://otg.cfg \
		   file://S4_support.cfg \
		   file://Sema.cfg \
		   file://ipu.cfg \
		   file://0001-Allocate-FB-for-HDMI-DP-VGA-at-boot-time-even-device.patch \
		   file://0001-Removed-trace_printk-to-avoid-warning-while-booting.patch \
		   file://0001-SMbus.patch \	
		   file://0001-OV2740-Camera-module-support.patch \	
      		   ${@bb.utils.contains('DISTRO_FEATURES', 'tpm', 'file://tpm.scc', '', d)} \
   	           ${@bb.utils.contains('DISTRO_FEATURES', 'tpm2', 'file://tpm2.scc', '', d)} \		   	
"
#c3800 soc kernel  configuration
# Additional Kernel Features to enable QAT, DPDK and QEMU-KVM
KERNEL_FEATURES_append = " features/qat/qat.scc"
KERNEL_FEATURES_append = " features/x2apic/x2apic.scc"
KERNEL_FEATURES_append = " features/vfio/vfio.scc"
KERNEL_FEATURES_append = " features/numa/numa.scc"
KERNEL_FEATURES_append = " features/mtd/mtd.scc"
KERNEL_FEATURES_append = " features/iommu/iommu.scc"
KERNEL_FEATURES_append = " features/intel-txt/intel-txt.scc"
KERNEL_FEATURES_append = " features/kvm/qemu-kvm-enable.scc"

# OOT IXGBE & IXGBEVF kernel
IMAGE_INSTALL_append = " ixgbe"
IMAGE_INSTALL_append = " ixgbevf"

# Enable i2c-dev autoload
INTEL_COMMON_AUTOLOAD += "i2c-dev"
