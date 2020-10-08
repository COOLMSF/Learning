        .global _start
        .text

_start:
        # mkdir("new_dir")
        # rax for mkdir syscall 83
        movq $83, %rax
        # rdi for directory name
        movq $dir_name, %rdi
        # rsi for permission, 0777 or 0x1ff
        movq $0x1ff, %rsi
        syscall

        # set syscall number to zero
        xorq %rax, %rax

        # exit(0)
        # rax for exit syscall 60
        movq $60, %rax
        # rdi for status
        movq $0, %rdi
        syscall

dir_name:
        # \0 means to end the string, or it mighr be something wierd
        .ascii "new_dir\0"

