BOOTLOADER = bootloader
IMG_FILE = myos.img
MAKE = make -r

# default make is make all
all:img
boot:
	nasm -o bootloader hello.nas
img:boot
	dd if=bootloader of=myos.img count=1 bs=512
	dd if=/dev/zero of=myos.img bs=512 seek=1 skip=1 count=2879
run:
	$(MAKE) img
	qemu-system-i386 -drive file=myos.img,if=floppy

debug: 
	$(MAKE) img
	qemu-system-i386 $(BOOTLOADER) -S -s
clean:
	rm bootloader myos.img
