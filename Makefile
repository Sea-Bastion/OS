all: run


bin/bootsector.bin: boot/sector.asm
	nasm -f bin $< -o $@

bin/kernal.bin: kernal/kernal.o kernal/bootstrapper.o
	i386-elf-ld --oformat binary $^ -o $@

kernal/kernal.o: kernal/kernal.c
	i386-elf-gcc -ffreestanding -c $< -o $@

kernal/bootstrapper.o: kernal/boostrapper.c
	nasm -f elf $< -o $@

os-image.img: bin/bootsector.bin bin/kernal.bin
	dd if=/dev/zero of=$@ bs=0x1000 count=1
	dd if=$< of=$@ conv=notrunc
	dd if=$(word 2,$^) of=$@ bs=0x1000 seek=1 conv=notrunc

run: os-image.img
	qemu-system-x86_64 $<
