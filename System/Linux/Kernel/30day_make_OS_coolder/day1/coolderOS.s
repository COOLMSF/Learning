# hello.s
# org 0x7c00, I don't know how to translate this instruction into AT&T syntax
.global start
.code16

start:
	jmp entry
	
entry:

	mov $0, %ax
	mov %ax, %ss
	mov %ax, %ds
	mov %ax, %es

	mov $0x7c00, %sp

	mov $msg, %si
	# call puts
	jmp puts

puts:
	mov (%si),%al
	add $1,%si
	cmp $0,%al
	je fin
	movb $0x0e,%ah
	int $0x10
	jmp puts

fin:
	hlt
	jmp fin

msg:
	.asciz "coolder's OS"

.org 510
.word 0xaa55
