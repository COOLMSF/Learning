.global	_start

.text
_start:
	movl  $0, %ebx   # 4 (code for "write" syscall) -> EAX register
