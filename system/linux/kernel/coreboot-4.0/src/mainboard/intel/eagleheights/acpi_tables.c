/*
 * This file is part of the coreboot project.
 *
 * Copyright (C) 2007-2008 coresystems GmbH
 * Copyright (C) 2009 Thomas Jourdan <thomas.jourdan@gmail.com>
 *
 * This program is free software; you can redistribute it and/or
 * modify it under the terms of the GNU General Public License as
 * published by the Free Software Foundation; version 2 of
 * the License.
 *
 * This program is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU General Public License for more details.
 *
 * You should have received a copy of the GNU General Public License
 * along with this program; if not, write to the Free Software
 * Foundation, Inc., 51 Franklin St, Fifth Floor, Boston,
 * MA 02110-1301 USA
 */

#include <string.h>
#include <console/console.h>
#include <arch/acpi.h>
#include <device/device.h>
#include <device/pci.h>
#include <device/pci_ids.h>
#include "ioapic.h"

extern unsigned char AmlCode[];

unsigned long acpi_fill_mcfg(unsigned long current)
{
	device_t dev;
	u64 mmcfg;

	dev = dev_find_device(0x8086, 0x35B0, 0);	// 0:0x13.0
	if (!dev)
		return current;

	// MMCFG not supported or not enabled.
	mmcfg = ((u64) pci_read_config16(dev, 0xce)) << 16;
	if (!mmcfg)
		return current;

	current += acpi_create_mcfg_mmconfig((acpi_mcfg_mmconfig_t *) current,
			mmcfg, 0x0, 0x0, 0xff);

	return current;
}

void acpi_create_intel_hpet(acpi_hpet_t * hpet)
{
#define HPET_ADDR  0xfed00000ULL
	acpi_header_t *header = &(hpet->header);
	acpi_addr_t *addr = &(hpet->addr);

	memset((void *) hpet, 0, sizeof(acpi_hpet_t));

	/* fill out header fields */
	memcpy(header->signature, "HPET", 4);
	memcpy(header->oem_id, OEM_ID, 6);
	memcpy(header->oem_table_id, "IC      ", 8);
	memcpy(header->asl_compiler_id, ASLC, 4);

	header->length = sizeof(acpi_hpet_t);
	header->revision = 1;

	/* fill out HPET address */
	// XXX factory bios just puts an address here -- who's right?
	addr->space_id = 0;	/* Memory */
	addr->bit_width = 64;
	addr->bit_offset = 0;
	addr->addrl = HPET_ADDR & 0xffffffff;
	addr->addrh = HPET_ADDR >> 32;

	hpet->id = 0x80861234;
	hpet->number = 0x00;
	hpet->min_tick = 0x0090;

	header->checksum = acpi_checksum((void *) hpet, sizeof(acpi_hpet_t));
}

#define IO_APIC0 2
#define IO_APIC1 3
#define IO_APIC0_ADDR	0xfec00000UL
#define IO_APIC1_ADDR	0xfec10000UL

unsigned long acpi_fill_madt(unsigned long current)
{
	unsigned int irq_start = 0;
	device_t dev = 0;
	struct resource* res = NULL;
	unsigned char bus_isa;

	/* Local Apic */
	current += acpi_create_madt_lapic((acpi_madt_lapic_t *) current, 1, 0);
	// This one is for the second core... Will it hurt?
	current += acpi_create_madt_lapic((acpi_madt_lapic_t *) current, 2, 1);

	/* IOAPIC */
	current += acpi_create_madt_ioapic((acpi_madt_ioapic_t *) current, IO_APIC0, IO_APIC0_ADDR, irq_start);
	irq_start += INTEL_IOAPIC_NUM_INTERRUPTS;
	current += acpi_create_madt_ioapic((acpi_madt_ioapic_t *) current, IO_APIC1, IO_APIC1_ADDR, irq_start);
	irq_start += INTEL_IOAPIC_NUM_INTERRUPTS;

	dev = dev_find_slot(0, PCI_DEVFN(0x1e,0));

	if (dev) {
		bus_isa = pci_read_config8(dev, PCI_SUBORDINATE_BUS);
		bus_isa++;
	} else {
		printk_debug("ERROR - could not find PCI 0:1e.0, using defaults\n");
		bus_isa = 7;
	}

	/* Map ISA IRQ 0 to IRQ 2 */
	current += acpi_create_madt_irqoverride((acpi_madt_irqoverride_t *) current, bus_isa, 0, 2, 0);

	/* IRQ9 differs from ISA standard - ours is active high, level-triggered */
	current += acpi_create_madt_irqoverride((acpi_madt_irqoverride_t *) current, 0, 9, 9, 0x000d);

	return current;
}

unsigned long acpi_fill_slit(unsigned long current)
{
	// Not implemented
	return current;
}

unsigned long acpi_fill_srat(unsigned long current)
{
	/* No NUMA, no SRAT */
	return current;
}


#define ALIGN_CURRENT current = ((current + 0x0f) & -0x10)
unsigned long write_acpi_tables(unsigned long start)
{
	unsigned long current;
	int i;
	acpi_rsdp_t *rsdp;
	acpi_rsdt_t *rsdt;
	acpi_hpet_t *hpet;
	acpi_madt_t *madt;
	acpi_mcfg_t *mcfg;
	acpi_fadt_t *fadt;
	acpi_facs_t *facs;
	acpi_header_t *dsdt;

	current = start;

	/* Align ACPI tables to 16byte */
	ALIGN_CURRENT;

	printk_info("ACPI: Writing ACPI tables at %lx.\n", current);

	/* We need at least an RSDP and an RSDT Table */
	rsdp = (acpi_rsdp_t *) current;
	current += sizeof(acpi_rsdp_t);
	ALIGN_CURRENT;
	rsdt = (acpi_rsdt_t *) current;
	current += sizeof(acpi_rsdt_t);
	ALIGN_CURRENT;

	/* clear all table memory */
	memset((void *) start, 0, current - start);

	acpi_write_rsdp(rsdp, rsdt, NULL);
	acpi_write_rsdt(rsdt);

	/*
	 * We explicitly add these tables later on:
	 */
	printk_debug("ACPI:    * HPET\n");

	hpet = (acpi_hpet_t *) current;
	current += sizeof(acpi_hpet_t);
	ALIGN_CURRENT;
	acpi_create_intel_hpet(hpet);
	acpi_add_table(rsdp, hpet);

	/* If we want to use HPET Timers Linux wants an MADT */
	printk_debug("ACPI:    * MADT\n");

	madt = (acpi_madt_t *) current;
	acpi_create_madt(madt);
	current += madt->header.length;
	ALIGN_CURRENT;
	acpi_add_table(rsdp, madt);

	printk_debug("ACPI:    * MCFG\n");
	mcfg = (acpi_mcfg_t *) current;
	acpi_create_mcfg(mcfg);
	current += mcfg->header.length;
	ALIGN_CURRENT;
	acpi_add_table(rsdp, mcfg);

	printk_debug("ACPI:     * FACS\n");
	facs = (acpi_facs_t *) current;
	current += sizeof(acpi_facs_t);
	ALIGN_CURRENT;
	acpi_create_facs(facs);

	dsdt = (acpi_header_t *) current;
	current += ((acpi_header_t *) AmlCode)->length;
	ALIGN_CURRENT;
	memcpy((void *) dsdt, (void *) AmlCode,
	       ((acpi_header_t *) AmlCode)->length);

	printk_debug("ACPI:     * DSDT @ %p Length %x\n", dsdt,
		     dsdt->length);

	printk_debug("ACPI:     * FADT\n");
	fadt = (acpi_fadt_t *) current;
	current += sizeof(acpi_fadt_t);
	ALIGN_CURRENT;

	acpi_create_fadt(fadt, facs, dsdt);
	acpi_add_table(rsdp, fadt);

	printk_info("ACPI: done.\n");
	return current;
}