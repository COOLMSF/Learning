/*
 * This file is part of the coreboot project.
 *
 * Copyright (C) 2007 AMD
 * Written by Yinghai Lu <yinghailu@amd.com> for AMD.
 *
 * This program is free software; you can redistribute it and/or modify
 * it under the terms of the GNU General Public License as published by
 * the Free Software Foundation; either version 2 of the License, or
 * (at your option) any later version.
 *
 * This program is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU General Public License for more details.
 *
 * You should have received a copy of the GNU General Public License
 * along with this program; if not, write to the Free Software
 * Foundation, Inc., 51 Franklin St, Fifth Floor, Boston, MA  02110-1301 USA
 */

#include <console/console.h>
#include <arch/smp/mpspec.h>
#include <device/pci.h>
#include <string.h>
#include <stdint.h>
#include <cpu/amd/amdk8_sysconf.h>

extern unsigned char bus_isa;
extern unsigned char bus_mcp55[8];	// 1
extern unsigned apicid_mcp55;
extern unsigned bus_type[256];

extern void get_bus_conf(void);

void *smp_write_config_table(void *v)
{
	static const char sig[4] = "PCMP";
	static const char oem[8] = "MSI     ";
	static const char productid[12] = "MS-7260     ";
	struct mp_config_table *mc;
	unsigned int sbdn;
	int i, j;

	mc = (void *)(((char *)v) + SMP_FLOATING_TABLE_LEN);
	memset(mc, 0, sizeof(*mc));

	memcpy(mc->mpc_signature, sig, sizeof(sig));
	mc->mpc_length = sizeof(*mc);	/* Initially just the header */
	mc->mpc_spec = 0x04;
	mc->mpc_checksum = 0;		/* Not yet computed */
	memcpy(mc->mpc_oem, oem, sizeof(oem));
	memcpy(mc->mpc_productid, productid, sizeof(productid));
	mc->mpc_oemptr = 0;
	mc->mpc_oemsize = 0;
	mc->mpc_entry_count = 0;	/* No entries yet... */
	mc->mpc_lapic = LAPIC_ADDR;
	mc->mpe_length = 0;
	mc->mpe_checksum = 0;
	mc->reserved = 0;

	smp_write_processors(mc);

	get_bus_conf();
	sbdn = sysconf.sbdn;

	/* Bus:	Bus ID	Type */
	/* Define bus and ISA numbers. */
	for (j = 0; j < 256; j++) {
		if (bus_type[j])
			smp_write_bus(mc, j, "PCI   ");
	}
	smp_write_bus(mc, bus_isa, "ISA   ");

	/* I/O APICs: APIC ID	Version	State		Address */
	{
		device_t dev;
		struct resource *res;
		uint32_t dword;

		dev = dev_find_slot(bus_mcp55[0], PCI_DEVFN(sbdn + 0x1, 0));
		if (dev) {
			res = find_resource(dev, PCI_BASE_ADDRESS_1);
			if (res)
				smp_write_ioapic(mc, apicid_mcp55, 0x11, res->base);

			dword = 0x43c6c643;
			pci_write_config32(dev, 0x7c, dword);

			dword = 0x81001a00;
			pci_write_config32(dev, 0x80, dword);

			dword = 0xd0001202;
			pci_write_config32(dev, 0x84, dword);
		}
	}

	/* I/O Ints:         Type       Trigger                Polarity              Bus ID        IRQ                    APIC ID       PIN# */
	smp_write_intsrc(mc, mp_ExtINT, MP_IRQ_TRIGGER_EDGE  | MP_IRQ_POLARITY_HIGH, bus_isa,      0x0,                   apicid_mcp55, 0x0);
	smp_write_intsrc(mc, mp_INT,    MP_IRQ_TRIGGER_EDGE  | MP_IRQ_POLARITY_HIGH, bus_isa,      0x1,                   apicid_mcp55, 0x1);
	smp_write_intsrc(mc, mp_INT,    MP_IRQ_TRIGGER_EDGE  | MP_IRQ_POLARITY_HIGH, bus_isa,      0x0,                   apicid_mcp55, 0x2);
	smp_write_intsrc(mc, mp_INT,    MP_IRQ_TRIGGER_EDGE  | MP_IRQ_POLARITY_HIGH, bus_isa,      0x3,                   apicid_mcp55, 0x3);
	smp_write_intsrc(mc, mp_INT,    MP_IRQ_TRIGGER_EDGE  | MP_IRQ_POLARITY_HIGH, bus_isa,      0x4,                   apicid_mcp55, 0x4);
	smp_write_intsrc(mc, mp_INT,    MP_IRQ_TRIGGER_EDGE  | MP_IRQ_POLARITY_HIGH, bus_isa,      0x6,                   apicid_mcp55, 0x6);
	smp_write_intsrc(mc, mp_INT,    MP_IRQ_TRIGGER_EDGE  | MP_IRQ_POLARITY_HIGH, bus_isa,      0x7,                   apicid_mcp55, 0x7);
	smp_write_intsrc(mc, mp_INT,    MP_IRQ_TRIGGER_EDGE  | MP_IRQ_POLARITY_HIGH, bus_isa,      0x8,                   apicid_mcp55, 0x8);
	smp_write_intsrc(mc, mp_INT,    MP_IRQ_TRIGGER_EDGE  | MP_IRQ_POLARITY_HIGH, bus_isa,      0xc,                   apicid_mcp55, 0xc);
	smp_write_intsrc(mc, mp_INT,    MP_IRQ_TRIGGER_EDGE  | MP_IRQ_POLARITY_HIGH, bus_isa,      0xd,                   apicid_mcp55, 0xd);
	smp_write_intsrc(mc, mp_INT,    MP_IRQ_TRIGGER_EDGE  | MP_IRQ_POLARITY_HIGH, bus_isa,      0xe,                   apicid_mcp55, 0xe);
	smp_write_intsrc(mc, mp_INT,    MP_IRQ_TRIGGER_EDGE  | MP_IRQ_POLARITY_HIGH, bus_isa,      0xf,                   apicid_mcp55, 0xf);
	smp_write_intsrc(mc, mp_INT,    MP_IRQ_TRIGGER_LEVEL | MP_IRQ_POLARITY_LOW,  bus_mcp55[0], ((sbdn + 1) << 2) | 1, apicid_mcp55, 0xa);
	smp_write_intsrc(mc, mp_INT,    MP_IRQ_TRIGGER_LEVEL | MP_IRQ_POLARITY_LOW,  bus_mcp55[0], ((sbdn + 2) << 2) | 0, apicid_mcp55, 0x16);	// 22
	smp_write_intsrc(mc, mp_INT,    MP_IRQ_TRIGGER_LEVEL | MP_IRQ_POLARITY_LOW,  bus_mcp55[0], ((sbdn + 2) << 2) | 1, apicid_mcp55, 0x17);	// 23
	smp_write_intsrc(mc, mp_INT,    MP_IRQ_TRIGGER_LEVEL | MP_IRQ_POLARITY_LOW,  bus_mcp55[0], ((sbdn + 6) << 2) | 1, apicid_mcp55, 0x17);	// 23
	smp_write_intsrc(mc, mp_INT,    MP_IRQ_TRIGGER_LEVEL | MP_IRQ_POLARITY_LOW,  bus_mcp55[0], ((sbdn + 5) << 2) | 0, apicid_mcp55, 0x14);	// 20
	smp_write_intsrc(mc, mp_INT,    MP_IRQ_TRIGGER_LEVEL | MP_IRQ_POLARITY_LOW,  bus_mcp55[0], ((sbdn + 5) << 2) | 1, apicid_mcp55, 0x17);	// 23
	smp_write_intsrc(mc, mp_INT,    MP_IRQ_TRIGGER_LEVEL | MP_IRQ_POLARITY_LOW,  bus_mcp55[0], ((sbdn + 5) << 2) | 2, apicid_mcp55, 0x15);	// 21
	smp_write_intsrc(mc, mp_INT,    MP_IRQ_TRIGGER_LEVEL | MP_IRQ_POLARITY_LOW,  bus_mcp55[0], ((sbdn + 8) << 2) | 0, apicid_mcp55, 0x16);	// 22

	for (j = 7; j >= 2; j--) {
		if (!bus_mcp55[j])
			continue;
		for (i = 0; i < 4; i++)
			smp_write_intsrc(mc, mp_INT, MP_IRQ_TRIGGER_LEVEL | MP_IRQ_POLARITY_LOW, bus_mcp55[j], (0x00 << 2) | i, apicid_mcp55, 0x10 + (2 + j + i + 4 - sbdn % 4) % 4);
	}

	for (j = 0; j < 2; j++) {
		for (i = 0; i < 4; i++)
			smp_write_intsrc(mc, mp_INT, MP_IRQ_TRIGGER_LEVEL | MP_IRQ_POLARITY_LOW, bus_mcp55[1], ((0x06 + j) << 2) | i, apicid_mcp55, 0x10 + (2 + i + j) % 4);
	}

	/* Local Ints:       Type       Trigger               Polarity              Bus ID   IRQ  APIC ID      PIN# */
	smp_write_intsrc(mc, mp_ExtINT, MP_IRQ_TRIGGER_EDGE | MP_IRQ_POLARITY_HIGH, bus_isa, 0x0, MP_APIC_ALL, 0x0);
	smp_write_intsrc(mc, mp_NMI,    MP_IRQ_TRIGGER_EDGE | MP_IRQ_POLARITY_HIGH, bus_isa, 0x0, MP_APIC_ALL, 0x1);

	/* There is no extension information... */

	/* Compute the checksums. */
	mc->mpe_checksum =
	    smp_compute_checksum(smp_next_mpc_entry(mc), mc->mpe_length);
	mc->mpc_checksum = smp_compute_checksum(mc, mc->mpc_length);
	printk_debug("Wrote the mp table end at: %p - %p\n",
		     mc, smp_next_mpe_entry(mc));
	return smp_next_mpe_entry(mc);
}

unsigned long write_smp_table(unsigned long addr)
{
	void *v;
	v = smp_write_floating_table(addr);
	return (unsigned long)smp_write_config_table(v);
}