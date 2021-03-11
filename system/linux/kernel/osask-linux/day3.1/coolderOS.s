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

    // Start to read sector

    // Dst addr es:bx
    // The segment of dst addr(es)
    mov $0x820, %ax
    mov %ax, %es
    // The offset of dst addr(bx)
    mov $0, %bx

    // Cylinder
    mov $0, %ch
    // Head
    mov $0, %dh
    // Sector
    mov $1, %cl
    //
    mov $0x2, %ah
    //
    mov $1, %al
    // Drive
    mov $0, %dl
    // Interrutp
    int $0x13
    jc error

    mov $msg_read_done, %si
    call

    hlt

puts:
	mov (%si),%al
	add $1,%si
	cmp $0,%al
	je fin
	movb $0x0e,%ah
	int $0x10
	jmp puts

msg_read_done:
    .asciz "Read sector done"

error:
    .asciz "Error occured"

.org 510
.word 0xaa55
