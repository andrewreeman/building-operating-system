

# nasm -f bin boot_sector.asm -o boot_sector.bin

# gcc -ffreestanding -c kernel.c -o kernel.o

# ld -o kernel.bin -Ttext 0x1000 kernel_entry.o kernel.o --oformat binary

# cat boot_sector.bin kernel.bin > os-image

kernel.bin: kernel_entry.o kernel.o
	ld -o kernel.bin -Ttext 0x1000 $^ --oformat binary

kernel.o: kernel.c
	gcc -ffreestanding -c $< -o $@

kernel_entry.o: kernel_entry.asm
	nasm $< -f elf -o $@	

clean: 
	rm kernel_entry.o kernel.o kernel.bin