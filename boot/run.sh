nasm -f bin boot_sector.asm -o out.bin
qemu-system-x86_64 out.bin