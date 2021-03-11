driver-y += northbridge.o
driver-y += misc_control.o
obj-y += get_sblk_pci1234.o
obj-$(CONFIG_GENERATE_ACPI_TABLES) += amdk8_acpi.o

# Enable this if you want to check the values of the PCI routing registers.
# Call show_all_routes() anywhere amdk8.h is included.
#obj-y += util.o

# Not sure what to do with these yet. How did raminit_test even work?
# Should be a target in -y form.
#if CONFIG_K8_REV_F_SUPPORT
#
#makerule raminit_test
#	depends "$(TOP)/src/northbridge/amd/amdk8/raminit_test.c"
#	depends "$(TOP)/src/northbridge/amd/amdk8/raminit_f.c"
#	action "$(HOSTCC) $(HOSTCFLAGS) $(CPUFLAGS) -Wno-unused-function -I$(TOP)/src/include -g  $< -o $@"
#end
#
#else
#
#makerule raminit_test
#	depends "$(TOP)/src/northbridge/amd/amdk8/raminit_test.c"
#	depends "$(TOP)/src/northbridge/amd/amdk8/raminit.c"
#	action "$(HOSTCC) $(HOSTCFLAGS) $(CPUFLAGS) -Wno-unused-function -I$(TOP)/src/include -g  $< -o $@"
#end
#
#end
#