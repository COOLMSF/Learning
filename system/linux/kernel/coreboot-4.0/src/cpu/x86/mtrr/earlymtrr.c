#ifndef EARLYMTRR_C
#define EARLYMTRR_C
#include <cpu/x86/cache.h>
#include <cpu/x86/mtrr.h>
#include <cpu/x86/msr.h>

/* Validate CONFIG_XIP_ROM_SIZE and CONFIG_XIP_ROM_BASE */
#if defined(CONFIG_XIP_ROM_SIZE) && !defined(CONFIG_XIP_ROM_BASE)
# error "CONFIG_XIP_ROM_SIZE without CONFIG_XIP_ROM_BASE"
#endif
#if defined(CONFIG_XIP_ROM_BASE) && !defined(CONFIG_XIP_ROM_SIZE)
# error "CONFIG_XIP_ROM_BASE without CONFIG_XIP_ROM_SIZE"
#endif
#if !defined(CONFIG_RAMTOP)
# error "CONFIG_RAMTOP not defined"
#endif

#if defined(CONFIG_XIP_ROM_SIZE) && ((CONFIG_XIP_ROM_SIZE & (CONFIG_XIP_ROM_SIZE -1)) != 0)
# error "CONFIG_XIP_ROM_SIZE is not a power of 2"
#endif
#if defined(CONFIG_XIP_ROM_SIZE) && ((CONFIG_XIP_ROM_BASE % CONFIG_XIP_ROM_SIZE) != 0)
# error "CONFIG_XIP_ROM_BASE is not a multiple of CONFIG_XIP_ROM_SIZE"
#endif

#if (CONFIG_RAMTOP & (CONFIG_RAMTOP -1)) != 0
# error "CONFIG_RAMTOP must be a power of 2"
#endif

static void disable_var_mtrr(unsigned reg)
{
	/* The invalid bit is kept in the mask so we simply
	 * clear the relevent mask register to disable a
	 * range.
	 */
	msr_t zero;
	zero.lo = zero.hi = 0;
	wrmsr(MTRRphysMask_MSR(reg), zero);
}

static void set_var_mtrr(
	unsigned reg, unsigned base, unsigned size, unsigned type)

{
	/* Bit Bit 32-35 of MTRRphysMask should be set to 1 */
	/* FIXME: It only support 4G less range */
	msr_t basem, maskm;
	basem.lo = base | type;
	basem.hi = 0;
	wrmsr(MTRRphysBase_MSR(reg), basem);
	maskm.lo = ~(size - 1) | 0x800;
	maskm.hi = (1<<(CONFIG_CPU_ADDR_BITS-32))-1;
	wrmsr(MTRRphysMask_MSR(reg), maskm);
}

static void set_var_mtrr_x(
        unsigned reg, uint32_t base_lo, uint32_t base_hi, uint32_t size_lo, uint32_t size_hi, unsigned type)

{
        /* Bit Bit 32-35 of MTRRphysMask should be set to 1 */
        msr_t basem, maskm;
        basem.lo = (base_lo & 0xfffff000) | type;
        basem.hi = base_hi & ((1<<(CONFIG_CPU_ADDR_BITS-32))-1);
        wrmsr(MTRRphysBase_MSR(reg), basem);
       	maskm.hi = (1<<(CONFIG_CPU_ADDR_BITS-32))-1;
	if(size_lo) {
	        maskm.lo = ~(size_lo - 1) | 0x800;
	} else {
		maskm.lo = 0x800;
		maskm.hi &= ~(size_hi - 1);
	}
        wrmsr(MTRRphysMask_MSR(reg), maskm);
}

static void cache_lbmem(int type)
{
	/* Enable caching for 0 - 1MB using variable mtrr */
	disable_cache();
	set_var_mtrr(0, 0x00000000, CONFIG_RAMTOP, type);
	enable_cache();
}

/* the fixed and variable MTTRs are power-up with random values,
 * clear them to MTRR_TYPE_UNCACHEABLE for safty.
 */
static void do_early_mtrr_init(const unsigned long *mtrr_msrs)
{
	/* Precondition:
	 *   The cache is not enabled in cr0 nor in MTRRdefType_MSR
	 *   entry32.inc ensures the cache is not enabled in cr0
	 */
	msr_t msr;
	const unsigned long *msr_addr;

	/* Inialize all of the relevant msrs to 0 */
	msr.lo = 0;
	msr.hi = 0;
	unsigned long msr_nr;
	for(msr_addr = mtrr_msrs; (msr_nr = *msr_addr); msr_addr++) {
		wrmsr(msr_nr, msr);
	}

#if defined(CONFIG_XIP_ROM_SIZE)
	/* enable write through caching so we can do execute in place
	 * on the flash rom.
	 */
	set_var_mtrr(1, CONFIG_XIP_ROM_BASE, CONFIG_XIP_ROM_SIZE, MTRR_TYPE_WRBACK);
#endif

	/* Set the default memory type and enable fixed and variable MTRRs 
	 */
	/* Enable Variable MTRRs */
	msr.hi = 0x00000000;
	msr.lo = 0x00000800;
	wrmsr(MTRRdefType_MSR, msr);
	
}

static void early_mtrr_init(void)
{
	static const unsigned long mtrr_msrs[] = {
		/* fixed mtrr */
		0x250, 0x258, 0x259,
		0x268, 0x269, 0x26A,
		0x26B, 0x26C, 0x26D,
		0x26E, 0x26F,
		/* var mtrr */
		0x200, 0x201, 0x202, 0x203,
		0x204, 0x205, 0x206, 0x207,
		0x208, 0x209, 0x20A, 0x20B,
		0x20C, 0x20D, 0x20E, 0x20F,
		/* NULL end of table */
		0
	};
	disable_cache();
	do_early_mtrr_init(mtrr_msrs);
	enable_cache();
}

static int early_mtrr_init_detected(void)
{
	msr_t msr;
	/* See if MTRR's are enabled.
	 * a #RESET disables them while an #INIT
	 * preserves their state.  This works
	 * on both Intel and AMD cpus, at least
	 * according to the documentation.
	 */
	msr = rdmsr(MTRRdefType_MSR);
	return msr.lo & 0x00000800;
}

#endif /* EARLYMTRR_C */