src=coolderOS.s
obj=coolderOS.o
elf=coolderOS.elf
sys=coolderOS.sys
img=coolderOS.img
make=make -r

# run:
# 	$(make) build
# 	qemu-system-i386 $(sys)

run:$(sys)
	qemu-system-i386 -drive file=$(img),if=floppy

build:
	gcc -c -m32 $(src) -o $(obj)
	
	# Create an elf file with entry address 0x7c00
	ld -m elf_i386 $(obj) -e start -Ttext 0x7c00 -o $(elf)

	# Extract .text(MBR)
	objcopy -S -O binary -j .text $(elf) $(sys)

img:$(sys)
	dd if=$(sys) of=$(img) count=1 bs=512
	dd if=/dev/zero of=$(img) bs=512 seek=1 skip=1 count=2879

debug:$(sys)
	qemu-system-i386 -drive file=$(img),if=floppy -S -s

clean:
	-rm *.o *.sys *.elf *.img
