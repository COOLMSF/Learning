.section .data

.section .text 
        .global main

main:
        jmp fun

hello:
        # write(1, message, 13)
        # mov $1, %rax
        mov $1, %al

        #mov $1, %rdi
        mov $1, %al
        pop %rcx

        mov %rcx, %rsi
        mov $0x10, %dl
        syscall

        # for exit syscall
        mov $60, %al
        syscall

fun:
        call hello
        message: .string "Hello, world.\n\0"
