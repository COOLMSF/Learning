        .global _start
        enter $0, $0
        movq $0xff, %rax
        movq (%rax), %rbx
        leave
