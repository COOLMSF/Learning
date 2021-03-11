.global start
.code16

start:
    call main

/*
 *  read_sector(dst_seg, dst_offset, drive, head, cylinder, sector, count)
 *  Basic sector reader implement.
 *
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
    mov %bp, %sp
    pop %bp
    ret

/*
 *  read_one_sector_common(dst_seg, dst_offset)
 *  This function read
 */
read_one_sector_common:
    push %bp
    mov %sp, %bp
    // Call read_sector(dst_seg, dst_offset, 0, 0, 0, 1, 1);
/*
 *  read_sector(dst_seg, dst_offset, drive, head, cylinder, sector, count)
 *  Basic sector reader implement.
 *
 *  dst_seg:es
 *  dst_offset:bx
 *  drive:dl
 *  head:dh
 *  cylinder:ch
 *  sector:cl
 *  count:al
 */
    push $0x1
    push $0x1
    push $0x0
    push $0x0
    push $0x0
    // dst_seg
    push 0x6(%bp)
    // dst_offset
    push 0x4(%bp)
    call read_sector

    // Reset disk
    mov $0x0, %ah
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

    // Leave space for variable
    sub 0x10, %sp

    mov $msg_coolderOS, %di
    call puts

    // Start to read sector
    // Read secer count
    mov $0, %si
read_next:
    // var_a = es
    mov $0x820, -0x2(%bp)
    // offset
    push $0x0
    // segment
    push -0x2(%bp)
    call read_one_sector_common
    jc int_error
    // es += 0x20
    // Next sector
    add $0x20, -0x2(%bp)
    add $1, %si
    cmp $5, %si
    jle read_next

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
