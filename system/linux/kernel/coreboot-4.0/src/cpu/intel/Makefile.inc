# Note: From here on down, we are socket-centric. Socket choice determines
# what other cpu files are included. 
#
# Therefore: ONLY include Makefile.inc from socket directories!

subdirs-$(CONFIG_CPU_INTEL_SOCKET_441) += socket_441
subdirs-$(CONFIG_CPU_INTEL_SOCKET_BGA956) += bga956
subdirs-$(CONFIG_CPU_INTEL_EP80579) += ep80579
subdirs-$(CONFIG_CPU_INTEL_SOCKET_MFCPGA478) += socket_mFCPGA478
subdirs-$(CONFIG_CPU_INTEL_SOCKET_MPGA478) += socket_mPGA478
subdirs-$(CONFIG_CPU_INTEL_SOCKET_MPGA479M) += socket_mPGA479M
subdirs-$(CONFIG_CPU_INTEL_SOCKET_MPGA603) += socket_mPGA603
subdirs-$(CONFIG_CPU_INTEL_SOCKET_MPGA604) += socket_mPGA604
subdirs-$(CONFIG_CPU_INTEL_SOCKET_PGA370) += socket_PGA370
subdirs-$(CONFIG_CPU_INTEL_SLOT_2) += slot_2

#socket_mPGA604_533Mhz
#socket_mPGA604_800Mhz