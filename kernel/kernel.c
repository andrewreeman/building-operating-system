#include "kernel.h"
#include "../drivers/screen.h"
#include "../drivers/keyboard.h"
#include "../cpu/isr.h"
#include "../cpu/timer.h"
#include "../cpu/idt.h"

void main() {
    isr_install();
    irq_install(); 
    
    kprint("Type something, it will go through the kernel\n"
        "Type END to halt the CPU\n> ");
}

void user_input(char* input) {
    if(strcmp(input, "END") == 0) {
        kprint("Stopping CPU");
        asm volatile("hlt");
    }

    kprint("You said: ");
    kprint(input);
    kprint("\n>");
}