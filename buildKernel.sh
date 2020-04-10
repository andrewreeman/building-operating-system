gcc -ffreestanding -c kernel.c -o kernel.o
ld -o kernel.bin -Ttext 0x1000 kernel.o --oformat binary
nasm kernel_entry.asm -f elf -o kernel_entry.o
ld -o kernel.bin -Ttext 0x1000 kernel_entry.o kernel.o --oformat binary
