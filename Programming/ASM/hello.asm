.section .data
    message: .string "Hello, world.\n\0"
    strlen = . - message

.section .text 
        .global main

main:
        # write(1, message, 13)

        # for write syscall
        mov $1, %rax

        mov $1, %rdi
        mov $0x4141, %rsi
        mov $strlen, %rdx
        syscall

        # for exit syscall
        mov $60, %rax
        syscall
