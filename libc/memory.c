#include "memory.h"

void memory_copy(char* source, char* dest, int num_bytes) {
    int i;
    for(i=0; i<num_bytes; i++){
        *(dest + i) = *(source + i);
    }
}

u32 free_memory_addr = 0x10000;

u32 kmalloc(u32 size, int align, u32* phys_addr) {
    if(align == 1 && (free_memory_addr & 0xFFFFF000)) {
        free_memory_addr &= 0xFFFFF000;
        free_memory_addr += 0x1000;
    }

    if(phys_addr) *phys_addr = free_memory_addr;
    u32 ret = free_memory_addr;
    free_memory_addr += size;
    return ret;
}