.global _start
.code16

_start:
    jmp main

main:
    mov $msg, %si
    call puts

puts:
    mov (%si), %ax
    add $1, %si
    cmp $0, %al
    je fin
    movb $0x0e, %ah
    mov $0xf, %bl
    int $0x10
    jmp puts

fin:
    hlt
    jmp fin

msg:
    .asciz "Hello world."
