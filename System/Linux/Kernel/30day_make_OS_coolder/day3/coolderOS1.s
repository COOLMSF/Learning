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

    mov $msg_coolderOS, %di
    call puts

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
    // Read one more sector may fail
    mov $2, %al
    // Drive
    mov $0, %dl
    // Interrutp
    int $0x13
    // Error
    jc puts_error

    mov $msg_read_sector_done, %di
    call puts

    hlt


puts:
    push %bp
    mov %sp, %bp
.next:
    mov (%di), %al
    add $1, %di
    cmp $0, %al
    je .fin
    // Put character
    mov $0x0e, %ah
    int $0x10
    jmp .next
.fin:
    leave
    ret

puts_error:
    mov $msg_int_err, %di
    call puts

msg_coolderOS:
    .asciz "Welcome to coolderOS"
msg_read_sector_done:
    .asciz "Read sector done"
msg_int_err:
    .asciz "Interrupt error"
msg_err:
    .asciz "Error occured"

.org 510
.word 0xaa55
