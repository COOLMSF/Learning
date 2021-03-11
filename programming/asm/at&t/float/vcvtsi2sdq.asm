.section .text
        .global _start

_start:
        movq $0x1, %rax
        vcvtsi2sdq %rax ,%xmm1, %xmm1
