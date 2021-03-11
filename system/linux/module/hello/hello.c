#include <linux/module.h>
#include <linux/init.h>

int
init_module(void)
{
	printk("Hello kernel.");
	return 0;
}

void
cleanup_module(void)
{
	printk("Bye kernel.");
}

module_init(init_module);
module_exit(cleanup_module);
