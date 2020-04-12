# Automatically generate lists of sources using wildcards .
C_SOURCES = $(wildcard kernel/*.c drivers/*.c cpu/*.c)
HEADERS = $(wildcard kernel/*.h drivers/*.h cpu/*.h)
# TODO : Make sources dep on all header files .
# Convert the *.c filenames to *.o to give a list of object files to build
OBJ = ${C_SOURCES:.c=.o cpu/interrupt.o }

all: os-image

debug:
	echo ${OBJ}

os-image: boot/boot_sector.bin kernel.bin
	cat $^ > $@

kernel.bin: kernel/kernel_entry.o ${OBJ}
	ld -o kernel.bin -Ttext 0x1000 $^ --oformat binary

%.o: %.c ${HEADERS}
	gcc -ffreestanding -c $< -o $@

%.o: %.asm
	nasm $< -f elf -o $@

%.bin : %.asm
	nasm $< -f bin -I ’../../16 bit /’ -o $@

# utilities
clean: 
	rm *.o *.bin os-image
	rm kernel/*.o boot/*.bin drivers/*.o cpu/*.o

kernel.dis : kernel.bin
	ndisasm -b 32 $ < > $@