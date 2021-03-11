subdir=./kernel
all:img
boot:
	nasm -o bootloader hello.nas
img:boot
	dd if=bootloader of=myos.img count=1 bs=512
	# This is a typical floppy disk with 1440KB
	# (512 * (2879 + 1)) / 1024 == 1440KB, plus 1 
	# is because the bootsector has been included
	# bootsector is at the head of the img file
	dd if=/dev/zero of=myos.img bs=512 seek=1 skip=1 count=2879
run:
	qemu-system-i386 -drive file=myos.img,if=floppy
clean:
	rm bootloader myos.img
