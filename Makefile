

# nasm -f bin boot_sector.asm -o boot_sector.bin

# gcc -ffreestanding -c kernel.c -o kernel.o

# ld -o kernel.bin -Ttext 0x1000 kernel_entry.o kernel.o --oformat binary

# cat boot_sector.bin kernel.bin > os-image
all: os-image



os-image: boot_sector.bin kernel.bin
	cat $^ > $@

kernel.bin: kernel_entry.o kernel.o
	ld -o kernel.bin -Ttext 0x1000 $^ --oformat binary

kernel.o: kernel/kernel.c
	gcc -ffreestanding -c $< -o $@

kernel_entry.o: kernel/kernel_entry.asm
	nasm $< -f elf -o $@	

boot_sector.bin: boot/boot_sector.asm
	nasm -f bin $< -o $@

# utilities
clean: 
	rm *.o *.bin os-image

kernel . dis : kernel . bin
	ndisasm -b 32 $ < > $@