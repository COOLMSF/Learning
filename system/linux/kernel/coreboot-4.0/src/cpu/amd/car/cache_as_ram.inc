/*
 * This file is part of the coreboot project.
 *
 * Copyright (C) 2005-2007 Advanced Micro Devices, Inc.
 * Copyright (C) 2008 Carl-Daniel Hailfinger
 *
 * This program is free software; you can redistribute it and/or modify
 * it under the terms of the GNU General Public License as published by
 * the Free Software Foundation; version 2 of the License.
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

#define CacheSize CONFIG_DCACHE_RAM_SIZE
#define CacheBase (0xd0000 - CacheSize)

/* leave some space for global variable to pass to RAM stage */
#define GlobalVarSize CONFIG_DCACHE_RAM_GLOBAL_VAR_SIZE

/* for CAR with FAM10 */
#define CacheSizeAPStack 0x400 /* 1K */

#define MSR_FAM10      0xC001102A

#define jmp_if_k8(x)	comisd	%xmm2, %xmm1; jb x

#define CPUID_MASK	0x0ff00f00
#define CPUID_VAL_FAM10_ROTATED	0x0f000010

#include <cpu/x86/mtrr.h>
#include <cpu/amd/mtrr.h>
/*
 XMM map:
    xmm1: cpu family
    xmm2: fam10 comparison value
    xmm3: backup ebx
*/

	/* Save the BIST result */
	movl	%eax, %ebp

	/*for normal part %ebx already contain cpu_init_detected from fallback call */

cache_as_ram_setup:

	movb	$0xA0, %al
	outb	%al, $0x80

	/* enable SSE */
	movl %cr4, %eax
	orl $(3<<9), %eax
	movl %eax, %cr4

	/* figure out cpu family */
	cvtsi2sd %ebx, %xmm3
	movl	$0x01, %eax
	cpuid
	/* base family is bits 8..11, extended family is bits 20..27 */
	andl	$CPUID_MASK, %eax
	/* reorder bits for easier comparison by value */
	roll	$0x10, %eax
	cvtsi2sd %eax, %xmm1
	movl	$CPUID_VAL_FAM10_ROTATED, %eax
	cvtsi2sd %eax, %xmm2
	cvtsd2si %xmm3, %ebx

	/* hope we can skip the double set for normal part */
#if ((CONFIG_HAVE_FAILOVER_BOOT == 1) && (CONFIG_USE_FAILOVER_IMAGE == 1)) || ((CONFIG_HAVE_FAILOVER_BOOT == 0) && (CONFIG_USE_FALLBACK_IMAGE == 1))

	/* check if cpu_init_detected */
	movl	$MTRRdefType_MSR, %ecx
	rdmsr
	andl	$(1 << 11), %eax
	movl	%eax, %ebx	/* We store the status */

	jmp_if_k8(CAR_FAM10_out_post_errata)

	/* for GH, CAR need to set DRAM Base/Limit Registers to direct that to node0 */

	/* Only BSP needed, for other nodes set during HT/memory init. */
	/* So we need to check if it is BSP */
	movl	$0x1b, %ecx
	rdmsr
	bt	$8, %eax /*BSC */
	jnc	CAR_FAM10_out

	/* Enable RT tables on BSP */
	movl	$0x8000c06c, %eax
	movw	$0xcf8, %dx
	outl	%eax, %dx
	addw	$4, %dx
	inl	%dx, %eax
	btr	$0, %eax
	outl	%eax, %dx

	/* Setup temporary DRAM map: [0,16M) bit 0-23 */
	movl	$0x8000c144, %eax
	movw	$0xcf8, %dx
	outl	%eax, %dx
	addw	$4, %dx
	movl	$0, %eax
	outl	%eax, %dx

	movl	$0x8000c140, %eax
	movw	$0xcf8, %dx
	outl	%eax, %dx
	addw	$4, %dx
	movl	$3, %eax
	outl	%eax, %dx

CAR_FAM10_out:

	/* Errata 193: Disable clean copybacks to L3 cache to allow cached ROM.
	   Re-enable it in after RAM is initialized and before CAR is disabled */
	movl	$0xc001102a, %ecx
	rdmsr
	bts	$15, %eax
	wrmsr

	/* Erratum 343, RevGuide for Fam10h, Pub#41322 Rev. 3.33 */

	/* read-address has to be stored in the ecx register */
	movl	$MSR_FAM10, %ecx

	/* execute special read command for msr-register. Result is then in the EDX:EAX-registers (MSBs in EDX) */
	rdmsr

	/* Set bit 35 to 1 in EAX */
	bts	$35, %eax

	/* write back the modified register EDX:EAX to the MSR specified in ECX */
	wrmsr

	/* Erratum 343 end */

CAR_FAM10_out_post_errata:

	/* Set MtrrFixDramModEn for clear fixed mtrr */
enable_fixed_mtrr_dram_modify:
	movl	$SYSCFG_MSR, %ecx
	rdmsr
	andl	$(~(SYSCFG_MSR_MtrrFixDramEn | SYSCFG_MSR_MtrrVarDramEn)), %eax
	orl	$SYSCFG_MSR_MtrrFixDramModEn, %eax
	wrmsr

	/* Clear all MTRRs */
	xorl	%edx, %edx
	movl	$fixed_mtrr_msr, %esi

clear_fixed_var_mtrr:
	lodsl	(%esi), %eax
	testl	%eax, %eax
	jz	clear_fixed_var_mtrr_out

	movl	%eax, %ecx
	xorl	%eax, %eax
	wrmsr

	jmp	clear_fixed_var_mtrr
clear_fixed_var_mtrr_out:

/* 0x06 is the WB IO type for a given 4k segment.
 * 0x1e is the MEM IO type for a given 4k segment (K10 and above).
 * segs is the number of 4k segments in the area of the particular
 *   register we want to use for CAR.
 * reg is the register where the IO type should be stored.
 */
.macro extractmask segs, reg
.if \segs <= 0
	/* The xorl here is superfluous because at the point of first execution
	 * of this macro, %eax and %edx are cleared. Later invocations of this
	 * macro will have a monotonically increasing segs parameter.
	 */
	xorl \reg, \reg
.else
	jmp_if_k8(1f)

.if \segs == 1
	movl $0x1e000000, \reg /* WB MEM type */
.elseif \segs == 2
	movl $0x1e1e0000, \reg /* WB MEM type */
.elseif \segs == 3
	movl $0x1e1e1e00, \reg /* WB MEM type */
.elseif \segs >= 4
	movl $0x1e1e1e1e, \reg /* WB MEM type */
.endif
	jmp 2f
1:
.if \segs == 1
	movl $0x06000000, \reg /* WB IO type */
.elseif \segs == 2
	movl $0x06060000, \reg /* WB IO type */
.elseif \segs == 3
	movl $0x06060600, \reg /* WB IO type */
.elseif \segs >= 4
	movl $0x06060606, \reg /* WB IO type */
.endif
2:
.endif /* if \segs <= 0 */
.endm

/* size is the cache size in bytes we want to use for CAR.
 * windowoffset is the 32k-aligned window into CAR size
 */
.macro simplemask carsize, windowoffset
	.set gas_bug_workaround,(((\carsize - \windowoffset) / 0x1000) - 4)
	extractmask gas_bug_workaround, %eax
	.set gas_bug_workaround,(((\carsize - \windowoffset) / 0x1000))
	extractmask gas_bug_workaround, %edx
/* Without the gas bug workaround, the entire macro would consist only of the
 * two lines below.
	extractmask (((\carsize - \windowoffset) / 0x1000) - 4), %eax
	extractmask (((\carsize - \windowoffset) / 0x1000)), %edx
 */
.endm

#if CacheSize > 0x10000
#error Invalid CAR size, must be at most 64k.
#endif
#if CacheSize < 0x1000
#error Invalid CAR size, must be at least 4k. This is a processor limitation.
#endif
#if (CacheSize & (0x1000 - 1))
#error Invalid CAR size, is not a multiple of 4k. This is a processor limitation.
#endif

#if CacheSize > 0x8000
	/* enable caching for 32K-64K using fixed mtrr */
	movl	$0x268, %ecx  /* fix4k_c0000*/
	simplemask CacheSize, 0x8000
	wrmsr
#endif

	/* enable caching for 0-32K using fixed mtrr */
	movl	$0x269, %ecx  /* fix4k_c8000*/
	simplemask CacheSize, 0
	wrmsr

	/* enable memory access for first MBs using top_mem */
	movl	$TOP_MEM, %ecx
	xorl	%edx, %edx
	movl	$(((CONFIG_RAMTOP) + TOP_MEM_MASK) & ~TOP_MEM_MASK) , %eax
	wrmsr
#endif /*  CONFIG_USE_FAILOVER_IMAGE == 1*/

#if ((CONFIG_HAVE_FAILOVER_BOOT == 1) && (CONFIG_USE_FAILOVER_IMAGE == 0)) || ((CONFIG_HAVE_FAILOVER_BOOT == 0) && (CONFIG_USE_FALLBACK_IMAGE == 0))
	/* disable cache */
	movl	%cr0, %eax
	orl	$(0x1 << 30), %eax
	movl	%eax, %cr0

#endif

#if defined(CONFIG_XIP_ROM_SIZE) && defined(CONFIG_XIP_ROM_BASE)
	/* enable write base caching so we can do execute in place
	 * on the flash rom.
	 */
	movl	$0x202, %ecx
	xorl	%edx, %edx

#if defined(CONFIG_TINY_BOOTBLOCK) && CONFIG_TINY_BOOTBLOCK
#define REAL_XIP_ROM_BASE AUTO_XIP_ROM_BASE
#else
#define REAL_XIP_ROM_BASE CONFIG_XIP_ROM_BASE
#endif
       movl    $REAL_XIP_ROM_BASE, %eax
       orl     $MTRR_TYPE_WRBACK, %eax
	wrmsr

	movl	$0x203, %ecx
	movl	$0xff, %edx /* (1 << (CONFIG_CPU_ADDR_BITS - 32)) - 1 for K8 (CONFIG_CPU_ADDR_BITS = 40) */
	jmp_if_k8(wbcache_post_fam10_setup)
	movl	$0xffff, %edx /* (1 << (CONFIG_CPU_ADDR_BITS - 32)) - 1 for FAM10 (CONFIG_CPU_ADDR_BITS = 48) */
wbcache_post_fam10_setup:
	movl	$(~(CONFIG_XIP_ROM_SIZE - 1) | 0x800), %eax
	wrmsr
#endif /* CONFIG_XIP_ROM_SIZE && CONFIG_XIP_ROM_BASE */

#if ((CONFIG_HAVE_FAILOVER_BOOT == 1) && (CONFIG_USE_FAILOVER_IMAGE == 1)) || ((CONFIG_HAVE_FAILOVER_BOOT == 0) && (CONFIG_USE_FALLBACK_IMAGE == 1))
	/* Set the default memory type and enable fixed and variable MTRRs */
	movl	$MTRRdefType_MSR, %ecx
	xorl	%edx, %edx
	/* Enable Variable and Fixed MTRRs */
	movl	$0x00000c00, %eax
	wrmsr

	/* Enable the MTRRs and IORRs in SYSCFG */
	movl	$SYSCFG_MSR, %ecx
	rdmsr
	orl	$(SYSCFG_MSR_MtrrVarDramEn | SYSCFG_MSR_MtrrFixDramEn), %eax
	wrmsr
#endif

	movb	$0xA1, %al
	outb	%al, $0x80

	/* enable cache */
	movl	%cr0, %eax
	andl	$0x9fffffff, %eax
	movl	%eax, %cr0

	jmp_if_k8(fam10_end_part1)

	/* So we need to check if it is BSP */
	movl	$0x1b, %ecx
	rdmsr
	bt	$8, %eax /*BSC */
	jnc	CAR_FAM10_ap
fam10_end_part1:

	movb	$0xA2, %al
	outb	%al, $0x80

#if ((CONFIG_HAVE_FAILOVER_BOOT == 1) && (CONFIG_USE_FAILOVER_IMAGE == 1)) || ((CONFIG_HAVE_FAILOVER_BOOT == 0) && (CONFIG_USE_FALLBACK_IMAGE == 1))
	/* Read the range with lodsl*/
	cld
	movl	$CacheBase, %esi
	movl	$(CacheSize >> 2), %ecx
	rep	lodsl

	/* Clear the range */
	movl	$CacheBase, %edi
	movl	$(CacheSize >> 2), %ecx
	xorl	%eax, %eax
	rep	stosl

#endif /*CONFIG_USE_FAILOVER_IMAGE == 1*/

	/* set up the stack pointer */
	movl	$(CacheBase + CacheSize - GlobalVarSize), %eax
	movl	%eax, %esp

	movb	$0xA3, %al
	outb	%al, $0x80

	jmp	CAR_FAM10_ap_out
CAR_FAM10_ap:
	/* need to set stack pointer for AP */
	/* it will be from CacheBase + (CacheSize - GlobalVarSize)/2 - (NodeID<<CoreIDbits + CoreID) * CacheSizeAPStack*/
	/* So need to get the NodeID and CoreID at first */
	/* If NB_CFG bit 54 is set just use initial apicid, otherwise need to reverse it */

	/* store our init detected */
	movl	%ebx, %esi

	/* get the coreid bits at first */
	movl	$0x80000008, %eax
	cpuid
	shrl	$12, %ecx
	andl	$0x0f, %ecx
	movl	%ecx, %edi

	/* get the initial apic id */
	movl	$1, %eax
	cpuid
	shrl	$24, %ebx

	/* get the nb cfg bit 54 */
	movl	$0xc001001f, %ecx /* NB_CFG_MSR */
	rdmsr
	movl	%edi, %ecx	/* CoreID bits */
	bt	$(54-32), %edx
	jc	roll_cfg
	rolb	%cl, %bl
roll_cfg:

	/* calculate stack pointer */
	movl	$CacheSizeAPStack, %eax
	mull	%ebx
	movl	$(CacheBase + (CacheSize - GlobalVarSize)/2), %esp
	subl	%eax, %esp

	/* retrive init detected */
	movl	%esi, %ebx

	movb	$0xA4, %al
	outb	%al, $0x80

CAR_FAM10_ap_out:

	movb	$0xA5, %al
	outb	%al, $0x80

	/* disable SSE */
	movl %cr4, %eax
	andl $~(3<<9), %eax
	movl %eax, %cr4

	/* Restore the BIST result */
	movl	%ebp, %eax

	/* We need to set ebp ? No need */
	movl	%esp, %ebp
	pushl	%ebx  /* init detected */
	pushl	%eax  /* bist */
	call	cache_as_ram_main
	/* We will not go back */

	movb	$0xAF, %al	/* Should never see this postcode */
	outb	%al, $0x80

fixed_mtrr_msr:
	.long	0x250, 0x258, 0x259
	.long	0x268, 0x269, 0x26A
	.long	0x26B, 0x26C, 0x26D
	.long	0x26E, 0x26F
var_mtrr_msr:
	.long	0x200, 0x201, 0x202, 0x203
	.long	0x204, 0x205, 0x206, 0x207
	.long	0x208, 0x209, 0x20A, 0x20B
	.long	0x20C, 0x20D, 0x20E, 0x20F
var_iorr_msr:
	.long	0xC0010016, 0xC0010017, 0xC0010018, 0xC0010019
mem_top:
	.long	0xC001001A, 0xC001001D
	.long	0x000 /* NULL, end of table */

cache_as_ram_setup_out: