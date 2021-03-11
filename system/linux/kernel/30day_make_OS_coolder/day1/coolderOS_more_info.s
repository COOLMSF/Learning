# hello.s
# org 0x7c00, I don't know how to translate this instruction into AT&T syntax
.global start
.code16

start:
	# FAT12 disk format
	fat12:
		jmp entry
		.byte 0x00
		.ascii "coolder"
		.word 512
		.byte 1
		.word 1
		.byte 2
		.word 224
		.word 2880
		.byte 0xf0
		.word 9
		.word 18
		.word 2
		.long 0
		.long 0, 0, 0x29
		.long 0xffffffff
		.ascii "coolder's os"
		.ascii "FAT12"
		.fill 18
	
entry:
# Init registers
# 		mov $0, %ax
# 		mov $0, %ss
# 		mov $0, %ds
# 		mov $0, %es

	mov $0, %ax
	mov %ax, %ss
	mov %ax, %ds
	mov %ax, %es

	mov $0x7c00, %sp

	mov $msg, %si
	call puts

/*
puts:
# Display character
		movb (%si), %al
		add $1, %si
		cmp $0, %al
		je fin
		mov $0xe0, %ah
		mov $10, %bx
		int $0x10
		jmp putloop
*/

puts:
/*
   From wikipedia,
   Teletype output	AH=0Eh	AL = Character, 
   BH = Page Number, 
   BL = Color (only in graphic mode)
*/
	mov (%si),%al
	add $1,%si
	cmp $0,%al
	je fin
	movb $0x0e,%ah
	movw $15,%bx
	int $0x10
	jmp puts

fin:
	hlt
	jmp fin

msg:
	.asciz "coolder's OS"

.org 510
.word 0xaa55
