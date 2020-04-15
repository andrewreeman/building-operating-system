#ifndef MEMORY_H
#define MEMORY_H

#include "../cpu/types.h"

void memory_copy(char* source, char* dest, int num_bytes);
u32 kmalloc(u32 size, int align, u32* phys_addr);

#endif