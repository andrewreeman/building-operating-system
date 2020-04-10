[bits 32] ; should not be running in 32 bit protected mode
[extern main] ; declare that main will exist outside of this file

call main ; start running the kernel

jmp $ ; guard to hang when returning rom the kernel main