#include "../drivers/screen.h"
#include "../cpu/isr.h"
#include "../cpu/idt.h"

void main() {
    isr_install();

    // test interrupts
    __asm__ __volatile__("int $2");
    __asm__ __volatile__("int $3");

}