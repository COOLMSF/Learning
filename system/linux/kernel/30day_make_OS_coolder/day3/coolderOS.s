.global start
.code16

start:
    call main

/*
 *  read_sector(dst_seg, dst_offset, drive, head, cylinder, sector, count)
 *  dst_seg:es
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
    // The first argument is at 4(%bp), because call will put next IP in 2(%bp)
    mov 0x4(%bp), %ax
    mov %ax, %es
    mov 0x6(%bp), %bx
    mov 0x8(%bp), %dl
    mov 0xa(%bp), %dh
    mov 0xc(%bp), %ch
    mov 0xe(%bp), %cl
    mov 0x10(%bp), %al
    // Read sector for int 0x13
    mov $0x2, %ah
    int $0x13

    // Reset disk
    mov $0x0, %bx
    mov $0x0, %dl
    int $0x13

    mov %bp, %sp
    pop %bp
    ret

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

    jmp end

main:
    // Init registers
    mov $0, %ax
    mov %ax, %ss
    mov %ax, %ds
    mov %ax, %es

    // Init stack
    mov $0x7c00, %sp
    mov %sp, %bp

    // Enter
    push %bp
    mov %sp, %bp

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

    // Leave
    mov %bp, %sp
    pop %bp

    jmp end

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
