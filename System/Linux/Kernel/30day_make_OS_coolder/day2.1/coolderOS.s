.global start
.code16

start:
    jmp main

main:
    mov $msg_coolderOS, %di
    call puts

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

msg_coolderOS:
    .asciz "Welcome come to coolderOS"

msg_err:
    .asciz "An error occured."

msg_read_sector_error:
    .asciz "Read sector error."

msg_read_sector_retry:
    .asciz "Read sector retry."

msg_read_sector_done:
    .asciz "Read sector done."

.org 510
.word 0xaa55