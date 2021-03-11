.section .text
        .global _start

fac:
        # init result
        movq $1, %rax

        # init mutipicator
        movq $1, %rbx
        mul_loop:

            # result *= mutipicator
            imulq %rbx

            # mutipicator++
            addq $1, %rbx

            # if mutipicator < 10
            cmpq $10, %rbx

            jle mul_loop

        ret

_start:
        call fac
        movq $0xff, %rax
