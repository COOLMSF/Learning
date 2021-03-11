.global	_start

.text
_start:
        xor %ebx, %ebx
        mov $1, %al
        int $0x80 
