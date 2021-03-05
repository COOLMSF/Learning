.global start
.code16

start:
    jmp entry

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
    int $0x13

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

entry:
    mov $msg_coolderOS, %di
    call puts

    // read_sector(dst_seg, dst_offset, drive, head, cylinder, sector, count)
    push $0x1
    push $0x1
    push $0x0
    push $0x0
    push $0x0
    push $0x0
    push $0x820
    call read_sector
    jc int_error

    mov $msg_read_sector_done, %di
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
