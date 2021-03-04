/*
 * This file is part of the libpayload project.
 *
 * Copyright (C) 2008 Advanced Micro Devices, Inc.
 *
 * Redistribution and use in source and binary forms, with or without
 * modification, are permitted provided that the following conditions
 * are met:
 * 1. Redistributions of source code must retain the above copyright
 *    notice, this list of conditions and the following disclaimer.
 * 2. Redistributions in binary form must reproduce the above copyright
 *    notice, this list of conditions and the following disclaimer in the
 *    documentation and/or other materials provided with the distribution.
 * 3. The name of the author may not be used to endorse or promote products
 *    derived from this software without specific prior written permission.
 *
 * THIS SOFTWARE IS PROVIDED BY THE AUTHOR AND CONTRIBUTORS ``AS IS'' AND
 * ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE
 * IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE
 * ARE DISCLAIMED.  IN NO EVENT SHALL THE AUTHOR OR CONTRIBUTORS BE LIABLE
 * FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL
 * DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS
 * OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION)
 * HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT
 * LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY
 * OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF
 * SUCH DAMAGE.
 */

#include <libpayload-config.h>
#include <libpayload.h>
#include <curses.h>

#define I8042_CMD_READ_MODE  0x20
#define I8042_CMD_WRITE_MODE 0x60

#define I8042_MODE_XLATE     0x40

static void (*reset_handler)(void) = NULL;

struct layout_maps {
	char *country;
	unsigned short map[4][0x57];
};

struct layout_maps *map;

struct layout_maps keyboard_layouts[] = {
#ifdef CONFIG_PC_KEYBOARD_LAYOUT_US
{ .country = "us", .map = {
	{ /* No modifier */
	 0x00, 0x1B, 0x31, 0x32, 0x33, 0x34, 0x35, 0x36,
	 0x37, 0x38, 0x39, 0x30, 0x2D, 0x3D, 0x08, 0x09,
	 0x71, 0x77, 0x65, 0x72, 0x74, 0x79, 0x75, 0x69,
	 0x6F, 0x70, 0x5B, 0x5D, 0x0A, 0x00, 0x61, 0x73,
	 0x64, 0x66, 0x67, 0x68, 0x6A, 0x6B, 0x6C, 0x3B,
	 0x27, 0x60, 0x00, 0x5C, 0x7A, 0x78, 0x63, 0x76,
	 0x62, 0x6E, 0x6D, 0x2C, 0x2E, 0x2F, 0x00, 0x2A,
	 0x00, 0x20, 0x00, KEY_F(1), KEY_F(2), KEY_F(3), KEY_F(4), KEY_F(5),
	 KEY_F(6), KEY_F(7), KEY_F(8), KEY_F(9), KEY_F(10), 0x00, 0x00, KEY_HOME,
	 KEY_UP, KEY_NPAGE, 0x00, KEY_LEFT, 0x00, KEY_RIGHT, 0x00, KEY_END,
	 KEY_DOWN, KEY_PPAGE, 0x00, KEY_DC, 0x00, 0x00, 0x00
	 },
	{ /* Shift */
	 0x00, 0x1B, 0x21, 0x40, 0x23, 0x24, 0x25, 0x5E,
	 0x26, 0x2A, 0x28, 0x29, 0x5F, 0x2B, 0x08, 0x00,
	 0x51, 0x57, 0x45, 0x52, 0x54, 0x59, 0x55, 0x49,
	 0x4F, 0x50, 0x7B, 0x7D, 0x0A, 0x00, 0x41, 0x53,
	 0x44, 0x46, 0x47, 0x48, 0x4A, 0x4B, 0x4C, 0x3A,
	 0x22, 0x7E, 0x00, 0x7C, 0x5A, 0x58, 0x43, 0x56,
	 0x42, 0x4E, 0x4D, 0x3C, 0x3E, 0x3F, 0x00, 0x2A,
	 0x00, 0x20, 0x00, KEY_F(1), KEY_F(2), KEY_F(3), KEY_F(4), KEY_F(5),
	 KEY_F(6), KEY_F(7), KEY_F(8), KEY_F(9), KEY_F(10), 0x00, 0x00, KEY_HOME,
	 KEY_UP, KEY_NPAGE, 0x00, KEY_LEFT, 0x00, KEY_RIGHT, 0x00, KEY_END,
	 KEY_DOWN, KEY_PPAGE, 0x00, KEY_DC, 0x00, 0x00, 0x00
	 },
	{ /* ALT */
	 0x00, 0x1B, 0x31, 0x32, 0x33, 0x34, 0x35, 0x36,
	 0x37, 0x38, 0x39, 0x30, 0x2D, 0x3D, 0x08, 0x09,
	 0x71, 0x77, 0x65, 0x72, 0x74, 0x79, 0x75, 0x69,
	 0x6F, 0x70, 0x5B, 0x5D, 0x0A, 0x00, 0x61, 0x73,
	 0x64, 0x66, 0x67, 0x68, 0x6A, 0x6B, 0x6C, 0x3B,
	 0x27, 0x60, 0x00, 0x5C, 0x7A, 0x78, 0x63, 0x76,
	 0x62, 0x6E, 0x6D, 0x2C, 0x2E, 0x2F, 0x00, 0x2A,
	 0x00, 0x20, 0x00, KEY_F(1), KEY_F(2), KEY_F(3), KEY_F(4), KEY_F(5),
	 KEY_F(6), KEY_F(7), KEY_F(8), KEY_F(9), KEY_F(10), 0x00, 0x00, KEY_HOME,
	 KEY_UP, KEY_NPAGE, 0x00, KEY_LEFT, 0x00, KEY_RIGHT, 0x00, KEY_END,
	 KEY_DOWN, KEY_PPAGE, 0x00, KEY_DC, 0x00, 0x00, 0x00
	 },
	{ /* Shift-ALT */
	 0x00, 0x1B, 0x21, 0x40, 0x23, 0x24, 0x25, 0x5E,
	 0x26, 0x2A, 0x28, 0x29, 0x5F, 0x2B, 0x08, 0x00,
	 0x51, 0x57, 0x45, 0x52, 0x54, 0x59, 0x55, 0x49,
	 0x4F, 0x50, 0x7B, 0x7D, 0x0A, 0x00, 0x41, 0x53,
	 0x44, 0x46, 0x47, 0x48, 0x4A, 0x4B, 0x4C, 0x3A,
	 0x22, 0x7E, 0x00, 0x7C, 0x5A, 0x58, 0x43, 0x56,
	 0x42, 0x4E, 0x4D, 0x3C, 0x3E, 0x3F, 0x00, 0x2A,
	 0x00, 0x20, 0x00, KEY_F(1), KEY_F(2), KEY_F(3), KEY_F(4), KEY_F(5),
	 KEY_F(6), KEY_F(7), KEY_F(8), KEY_F(9), KEY_F(10), 0x00, 0x00, KEY_HOME,
	 KEY_UP, KEY_NPAGE, 0x00, KEY_LEFT, 0x00, KEY_RIGHT, 0x00, KEY_END,
	 KEY_DOWN, KEY_PPAGE, 0x00, KEY_DC, 0x00, 0x00, 0x00
	 }
}},
#endif
#ifdef CONFIG_PC_KEYBOARD_LAYOUT_DE
{ .country = "de", .map = {
	{ /* No modifier */
	 0x00, 0x1B, 0x31, 0x32, 0x33, 0x34, 0x35, 0x36,
	 0x37, 0x38, 0x39, 0x30, 0x00, 0x27, 0x08, 0x09,
	 0x71, 0x77, 0x65, 0x72, 0x74, 0x7A, 0x75, 0x69,
	 0x6F, 0x70, 0x00, 0x2B, 0x0A, 0x00, 0x61, 0x73,
	 0x64, 0x66, 0x67, 0x68, 0x6A, 0x6B, 0x6C, 0x00,
	 0x00, 0x5E, 0x00, 0x23, 0x79, 0x78, 0x63, 0x76,
	 0x62, 0x6E, 0x6D, 0x2C, 0x2E, 0x2D, 0x00, 0x2A,
	 0x00, 0x20, 0x00, KEY_F(1), KEY_F(2), KEY_F(3), KEY_F(4), KEY_F(5),
	 KEY_F(6), KEY_F(7), KEY_F(8), KEY_F(9), KEY_F(10), 0x00, 0x00, KEY_HOME,
	 KEY_UP, KEY_NPAGE, 0x00, KEY_LEFT, 0x00, KEY_RIGHT, 0x00, KEY_END,
	 KEY_DOWN, KEY_PPAGE, 0x00, KEY_DC, 0x00, 0x00, 0x3C
	 },
	{ /* Shift */
	 0x00, 0x1B, 0x21, 0x22, 0xA7, 0x24, 0x25, 0x26,
	 0x2F, 0x28, 0x29, 0x3D, 0x3F, 0x60, 0x08, 0x00,
	 0x51, 0x57, 0x45, 0x52, 0x54, 0x5A, 0x55, 0x49,
	 0x4F, 0x50, 0x00, 0x2A, 0x0A, 0x00, 0x41, 0x53,
	 0x44, 0x46, 0x47, 0x48, 0x4A, 0x4B, 0x4C, 0x00,
	 0x00, 0x7E, 0x00, 0x27, 0x59, 0x58, 0x43, 0x56,
	 0x42, 0x4E, 0x4D, 0x3B, 0x3A, 0x5F, 0x00, 0x2A,
	 0x00, 0x20, 0x00, KEY_F(1), KEY_F(2), KEY_F(3), KEY_F(4), KEY_F(5),
	 KEY_F(6), KEY_F(7), KEY_F(8), KEY_F(9), KEY_F(10), 0x00, 0x00, KEY_HOME,
	 KEY_UP, KEY_NPAGE, 0x00, KEY_LEFT, 0x00, KEY_RIGHT, 0x00, KEY_END,
	 KEY_DOWN, KEY_PPAGE, 0x00, KEY_DC, 0x00, 0x00, 0x3E
	 },
	{ /* ALT */
	 0x00, 0x1B, 0x31, 0x32, 0x33, 0x34, 0x35, 0x36,
	 0x7B, 0x5B, 0x5D, 0x7D, 0x5C, 0x3D, 0x08, 0x09,
	 0x40, 0x77, 0x65, 0x72, 0x74, 0x79, 0x75, 0x69,
	 0x6F, 0x70, 0x5B, 0x7E, 0x0A, 0x00, 0x61, 0x73,
	 0x64, 0x66, 0x67, 0x68, 0x6A, 0x6B, 0x6C, 0x3B,
	 0x27, 0x60, 0x00, 0x5C, 0x7A, 0x78, 0x63, 0x76,
	 0x62, 0x6E, 0x6D, 0x2C, 0x2E, 0x2F, 0x00, 0x2A,
	 0x00, 0x20, 0x00, KEY_F(1), KEY_F(2), KEY_F(3), KEY_F(4), KEY_F(5),
	 KEY_F(6), KEY_F(7), KEY_F(8), KEY_F(9), KEY_F(10), 0x00, 0x00, KEY_HOME,
	 KEY_UP, KEY_NPAGE, 0x00, KEY_LEFT, 0x00, KEY_RIGHT, 0x00, KEY_END,
	 KEY_DOWN, KEY_PPAGE, 0x00, KEY_DC, 0x00, 0x00, 0x7C
	 },
	{ /* Shift-ALT */
	 /* copied from US */
	 0x00, 0x1B, 0x21, 0x40, 0x23, 0x24, 0x25, 0x5E,
	 0x26, 0x2A, 0x28, 0x29, 0x5F, 0x2B, 0x08, 0x00,
	 0x51, 0x57, 0x45, 0x52, 0x54, 0x59, 0x55, 0x49,
	 0x4F, 0x50, 0x7B, 0x7D, 0x0A, 0x00, 0x41, 0x53,
	 0x44, 0x46, 0x47, 0x48, 0x4A, 0x4B, 0x4C, 0x3A,
	 0x22, 0x7E, 0x00, 0x7C, 0x5A, 0x58, 0x43, 0x56,
	 0x42, 0x4E, 0x4D, 0x3C, 0x3E, 0x3F, 0x00, 0x2A,
	 0x00, 0x20, 0x00, KEY_F(1), KEY_F(2), KEY_F(3), KEY_F(4), KEY_F(5),
	 KEY_F(6), KEY_F(7), KEY_F(8), KEY_F(9), KEY_F(10), 0x00, 0x00, KEY_HOME,
	 KEY_UP, KEY_NPAGE, 0x00, KEY_LEFT, 0x00, KEY_RIGHT, 0x00, KEY_END,
	 KEY_DOWN, KEY_PPAGE, 0x00, KEY_DC, 0x00, 0x00, 0x00
	 }
}},
#endif
};

#define MOD_SHIFT    (1 << 0)
#define MOD_CTRL     (1 << 1)
#define MOD_CAPSLOCK (1 << 2)
#define MOD_ALT      (1 << 3)

static void keyboard_cmd(unsigned char cmd, unsigned char val)
{
	outb(cmd, 0x60);
	/* wait until keyboard controller accepts cmds: */
	while (inb(0x64) & 2);
	outb(val, 0x60);
	while (inb(0x64) & 2);
}

int keyboard_havechar(void)
{
	unsigned char c = inb(0x64);
	return (c == 0xFF) ? 0 : c & 1;
}

unsigned char keyboard_get_scancode(void)
{
	unsigned char ch = 0;

	if (keyboard_havechar())
		ch = inb(0x60);

	return ch;
}

int keyboard_getchar(void)
{
	static int modifier = 0;
	unsigned char ch;
	int shift;
	int ret = 0;

	while (!keyboard_havechar()) ;

	ch = keyboard_get_scancode();

	switch (ch) {
	case 0x36:
	case 0x2a:
		modifier |= MOD_SHIFT;
		break;
	case 0x80 | 0x36:
	case 0x80 | 0x2a:
		modifier &= ~MOD_SHIFT;
		break;
	case 0x38:
		modifier |= MOD_ALT;
		break;
	case 0x80 | 0x38:
		modifier &= ~MOD_ALT;
		break;
	case 0x1d:
		modifier |= MOD_CTRL;
		break;
	case 0x80 | 0x1d:
		modifier &= ~MOD_CTRL;
		break;
	case 0x3a:
		if (modifier & MOD_CAPSLOCK) {
			modifier &= ~MOD_CAPSLOCK;
			keyboard_cmd(0xed, (0 << 2));
		} else {
			modifier |= MOD_CAPSLOCK;
			keyboard_cmd(0xed, (1 << 2));
		}
		break;
	}

	if (!(ch & 0x80) && ch < 0x57) {
		shift =
		    (modifier & MOD_SHIFT) ^ (modifier & MOD_CAPSLOCK) ? 1 : 0;

		if (modifier & MOD_ALT)
			shift += 2;

		ret = map->map[shift][ch];

		if (modifier & MOD_CTRL) {
			switch (ret) {
			case 'a' ... 'z':
				ret &= 0x1f;
				break;
			case KEY_DC:
				/* vulcan nerve pinch */
				if ((modifier & MOD_ALT) && reset_handler)
					reset_handler();
			default:
				ret = 0;
			}
		}
	}

	return ret;
}

static int keyboard_wait_read(void)
{
	int timeout = 10000;

	while(timeout-- && !(inb(0x64) & 0x01))
		udelay(50);

	return (timeout <= 0) ? -1 : 0;
}

static int keyboard_wait_write(void)
{
	int timeout = 10000;

	while(timeout-- && (inb(0x64) & 0x02))
		udelay(50);

	return (timeout <= 0) ? -1 : 0;
}

static unsigned char keyboard_get_mode(void)
{
	outb(I8042_CMD_READ_MODE, 0x64);
	keyboard_wait_read();
	return inb(0x60);
}

static void keyboard_set_mode(unsigned char mode)
{
	outb(I8042_CMD_WRITE_MODE, 0x64);
	keyboard_wait_write();
	outb(mode, 0x60);
}

/**
 * Set keyboard layout
 * @param country string describing the keyboard layout language. 
 * Valid values are "us", "de".
 */

int keyboard_set_layout(char *country)
{
	int i;

	for (i=0; i<ARRAY_SIZE(keyboard_layouts); i++) {
		if (strncmp(keyboard_layouts[i].country, country,
					strlen(keyboard_layouts[i].country)))
			continue;

		/* Found, changing keyboard layout */
		map = &keyboard_layouts[i];
		return 0;
	}

	/* Nothing found, not changed */
	return -1;
}

int keyboard_add_reset_handler(void (*new_handler)(void))
{
	reset_handler = new_handler;

	return 0;
}

static struct console_input_driver cons = {
	.havekey = keyboard_havechar,
	.getchar = keyboard_getchar
};

void keyboard_init(void)
{
	u8 mode;
	map = &keyboard_layouts[0];

	/* If 0x64 returns 0xff, then we have no keyboard
	 * controller */

	if (inb(0x64) == 0xFF)
		return;

	/* Empty keyboard buffer */
	while (keyboard_havechar()) keyboard_getchar();

	/* Read the current mode */
	mode = keyboard_get_mode();

	/* Turn on scancode translate mode so that we can
	   use the scancode set 1 tables */

	mode |= I8042_MODE_XLATE;

	/* Write the new mode */
	keyboard_set_mode(mode);

	console_add_input_driver(&cons);
}
