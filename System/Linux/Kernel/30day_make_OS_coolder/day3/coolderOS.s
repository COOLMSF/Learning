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
    // Read sector to mem
    mov $0x2, %ah
    // Sectors to read count
    mov $2, %al
    // Drive
    mov $0, %dl
    // Interrutp
    int $0x13
    // Error
    jc puts_error

    mov $msg_read_sector_done, %si
    call puts

puts:
	// Char
	mov (%si),%al
	add $1,%si
	cmp $0,%al
	je fin
	// Print charactor
	movb $0x0e,%ah
	int $0x10
	jmp puts

msg_read_sector_done:
    .asciz "Read sector done"

puts_error:
    mov $error_msg, %si
    call puts

error_msg:
    .asciz "Error occured"

fin:
    hlt
    jmp fin

.org 510
.word 0xaa55
