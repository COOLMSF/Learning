.section .text
        .global _start

.section .data
        .float_a: .long 1067450368
        .float_b: .long 1074790400
        

_start:
        // 1.25
        vmovss .float_a, %xmm0
        vmovss .float_b, %xmm1

        // add
        vaddss %xmm0, %xmm1, %xmm1
