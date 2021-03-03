.section .text
        .global _start

_start:
        movq $10, %rax
        movq $2, %rbx
        idivq %rbx
