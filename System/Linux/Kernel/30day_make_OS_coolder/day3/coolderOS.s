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

    call read_sector
    jc int_error

/*
 *  read_sector(dst_seg, dst_offset, drive, head, cylinder, sector, count)
 *  dst_seg:ax
 *  dst_offset:bx
 *  drive:dl
 *  head:dh
 *  cylinder:ch
 *  sector:cl
 *  count:al
 */
read_sector:
    push %bp
    mov %sp, %bp
    // Put the stack data into specify registers
    mov -0x2(%bp), %al
    mov -0x4(%bp), %cl
    mov -0x6(%bp), %ch
    mov -0x8(%bp), %dh
    mov -0xa(%bp), %dl
    mov -0xc(%bp), %bx
    mov -0xe(%bp), %ax
    // Read sector for int 0x13
    mov $0x2, %ah
    int 0x13

    mov $msg_read_sector_done, %di
    call puts

    jmp end

// puts(str)
// str:di
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

int_error:
    mov $msg_int_err, %di
    call puts

end:
    hlt
    jmp end

msg_coolderOS:
    .asciz "\r\n\n\rWelcome to coolderOS"
msg_read_sector_done:
    .asciz "\r\n\n\rRead sector done"
msg_int_err:
    .asciz "\r\n\n\rInterrupt error"
msg_err:
    .asciz "\r\n\n\rError occured"

.org 510
.word 0xaa55
