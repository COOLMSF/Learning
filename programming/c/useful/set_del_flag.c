#include<stdio.h>

#define FLAG_A 0x1
#define FLAG_B 0x2
#define FLAG_C 0x4
#define FLAG_D 0xA /* Suppose conflict with FLAG_C */
#define FLAG_INIT 0x0

int main(int argc, char *argv[])
{
	int val = FLAG_INIT;

	val |= FLAG_A;
	val |= FLAG_B;
	val |= FLAG_C;
	val |= FLAG_D; /* This is not allowed */

	 // val &= ~FLAG_A;
	 // val &= ~FLAG_B;
	 // val &= ~FLAG_C;
	 

	/*
	 * Why don't use this in kernel?
	 */
	// if ((val & (FLAG_C | FLAG_D))) {
	if ((val & (FLAG_C | FLAG_D)) == (FLAG_C | FLAG_D)) {
		puts("Both FLAG_C and FLAG_D are not allowed");
	}

	if (val & FLAG_A) {
		puts("FLAG_A set");
	}

	if (val & FLAG_B) {
		puts("FLAG_B set");
	}

	if (val & FLAG_C) {
		puts("FLAG_C set");
	}
}
