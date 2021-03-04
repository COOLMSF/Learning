/*
 * This file is part of the coreboot project.
 * 
 * Copyright (C) 2007-2009 coresystems GmbH
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

#include <types.h>
#include <string.h>
#include <console/console.h>
#include <arch/acpi.h>
#include <arch/acpigen.h>
#include <arch/smp/mpspec.h>
#include <device/device.h>
#include <device/pci.h>
#include <device/pci_ids.h>
#include <cpu/x86/msr.h>
#include "dmi.h"

extern unsigned char AmlCode[];
#if HAVE_ACPI_SLIC
unsigned long acpi_create_slic(unsigned long current);
#endif
void generate_cpu_entries(void); // from cpu/intel/speedstep

#include "../../../southbridge/intel/i82801gx/i82801gx_nvs.h"
static void acpi_create_gnvs(global_nvs_t *gnvs)
{
	memset((void *)gnvs, 0, sizeof(*gnvs));
	gnvs->apic = 1;
	gnvs->mpen = 1; /* Enable Multi Processing */

	/* Enable both COM ports */
	gnvs->cmap = 0x01;
	gnvs->cmbp = 0x01;

	/* IGD Displays */
	gnvs->ndid = 3;
	gnvs->did[0] = 0x80000100;
	gnvs->did[1] = 0x80000240;
	gnvs->did[2] = 0x80000410;
	gnvs->did[3] = 0x80000410;
	gnvs->did[4] = 0x00000005;
}

static void acpi_create_intel_hpet(acpi_hpet_t * hpet)
{
#define HPET_ADDR  0xfed00000ULL
	acpi_header_t *header = &(hpet->header);
	acpi_addr_t *addr = &(hpet->addr);

	memset((void *) hpet, 0, sizeof(acpi_hpet_t));

	/* fill out header fields */
	memcpy(header->signature, "HPET", 4);
	memcpy(header->oem_id, OEM_ID, 6);
	memcpy(header->oem_table_id, "COREBOOT", 8);
	memcpy(header->asl_compiler_id, ASLC, 4);

	header->length = sizeof(acpi_hpet_t);
	header->revision = 1;

	/* fill out HPET address */
	addr->space_id = 0;	/* Memory */
	addr->bit_width = 64;
	addr->bit_offset = 0;
	addr->addrl = HPET_ADDR & 0xffffffff;
	addr->addrh = HPET_ADDR >> 32;

	hpet->id = 0x8086a201;	/* Intel */
	hpet->number = 0x00;
	hpet->min_tick = 0x0080;

	header->checksum =
	    acpi_checksum((void *) hpet, sizeof(acpi_hpet_t));
}

#define IO_APIC_ADDR	0xfec00000UL

unsigned long acpi_fill_madt(unsigned long current)
{
	/* Local APICs */
	current = acpi_create_madt_lapics(current);

	/* IOAPIC */
	current += acpi_create_madt_ioapic((acpi_madt_ioapic_t *) current,
				2, IO_APIC_ADDR, 0);

	/* INT_SRC_OVR */
	current += acpi_create_madt_irqoverride((acpi_madt_irqoverride_t *)
		 current, 0, 0, 2, 0);
	current += acpi_create_madt_irqoverride((acpi_madt_irqoverride_t *)
		 current, 0, 9, 9, MP_IRQ_TRIGGER_LEVEL | MP_IRQ_POLARITY_HIGH);

	return current;
}

unsigned long acpi_fill_ssdt_generator(unsigned long current, const char *oem_table_id)
{
	generate_cpu_entries();
	return (unsigned long) (acpigen_get_current());
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

void smm_setup_structures(void *gnvs, void *tcg, void *smi1);

#define ALIGN_CURRENT current = ((current + 0x0f) & -0x10)
unsigned long write_acpi_tables(unsigned long start)
{
	unsigned long current;
	int i;
	acpi_rsdp_t *rsdp;
	acpi_rsdt_t *rsdt;
	acpi_xsdt_t *xsdt;
	acpi_hpet_t *hpet;
	acpi_madt_t *madt;
	acpi_mcfg_t *mcfg;
	acpi_fadt_t *fadt;
	acpi_facs_t *facs;
#if HAVE_ACPI_SLIC
	acpi_header_t *slic;
#endif
	acpi_header_t *ssdt;
	acpi_header_t *dsdt;

	current = start;

	/* Align ACPI tables to 16byte */
	ALIGN_CURRENT;

	printk_info("ACPI: Writing ACPI tables at %lx.\n", start);

	/* We need at least an RSDP and an RSDT Table */
	rsdp = (acpi_rsdp_t *) current;
	current += sizeof(acpi_rsdp_t);
	ALIGN_CURRENT;
	rsdt = (acpi_rsdt_t *) current;
	current += sizeof(acpi_rsdt_t);
	ALIGN_CURRENT;
	xsdt = (acpi_xsdt_t *) current;
	current += sizeof(acpi_xsdt_t);
	ALIGN_CURRENT;

	/* clear all table memory */
	memset((void *) start, 0, current - start);

	acpi_write_rsdp(rsdp, rsdt, xsdt);
	acpi_write_rsdt(rsdt);
	acpi_write_xsdt(xsdt);

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
	memcpy((void *) dsdt, (void *) AmlCode,
	       ((acpi_header_t *) AmlCode)->length);

	ALIGN_CURRENT;

	/* Pack GNVS into the ACPI table area */
	for (i=0; i < dsdt->length; i++) {
		if (*(u32*)(((u32)dsdt) + i) == 0xC0DEBABE) {
			printk_debug("ACPI: Patching up global NVS in DSDT at offset 0x%04x -> 0x%08x\n", i, current);
			*(u32*)(((u32)dsdt) + i) = current; // 0x92 bytes
			break;
		}
	}

	/* And fill it */
	acpi_create_gnvs(current);

	current += 0x100;
	ALIGN_CURRENT;

	/* And tell SMI about it */
	smm_setup_structures((void *)current, NULL, NULL);

	/* We patched up the DSDT, so we need to recalculate the checksum */
	dsdt->checksum = 0;
	dsdt->checksum = acpi_checksum((void *)dsdt, dsdt->length);

	printk_debug("ACPI:     * DSDT @ %p Length %x\n", dsdt,
		     dsdt->length);

#if HAVE_ACPI_SLIC
	printk_debug("ACPI:     * SLIC\n");
	slic = (acpi_header_t *)current;
	current += acpi_create_slic(current);
	ALIGN_CURRENT;
	acpi_add_table(rsdp, slic);
#endif

	printk_debug("ACPI:     * FADT\n");
	fadt = (acpi_fadt_t *) current;
	current += sizeof(acpi_fadt_t);
	ALIGN_CURRENT;

	acpi_create_fadt(fadt, facs, dsdt);
	acpi_add_table(rsdp, fadt);

	printk_debug("ACPI:     * SSDT\n");
	ssdt = (acpi_header_t *)current;
	acpi_create_ssdt_generator(ssdt, "COREBOOT");
	current += ssdt->length;
	acpi_add_table(rsdp, ssdt);
	ALIGN_CURRENT;

	printk_debug("current = %lx\n", current);

	printk_debug("ACPI:     * DMI (Linux workaround)\n");
	memcpy((void *)0xfff80, dmi_table, DMI_TABLE_SIZE);
#if CONFIG_WRITE_HIGH_TABLES == 1
	memcpy((void *)current, dmi_table, DMI_TABLE_SIZE);
	current += DMI_TABLE_SIZE;
	ALIGN_CURRENT;
#endif

	printk_info("ACPI: done.\n");
	return current;
}