.global	_start

.text
_start:	
		mov $-100, %eax
		# Save data
		and %eax, %eax
		jns end
		cmp %eax, %eax
		# <= 0
		jle asb
asb:
		add %eax, %ebx
		add %eax, %ebx
end:
		nop