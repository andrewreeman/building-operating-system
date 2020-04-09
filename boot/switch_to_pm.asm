[bits 16]

; switch to protected mode
switch_to_pm:
    cli ; Switch off interrupts until protected mode interrupt vector is setup
    
    lgdt [gdt_descriptor]  ; Load our global descriptor table which defines out protected mode segments: our code and data

    mov eax, cr0
    or eax, 0x1
    mov cr0, eax ; make the switch to 32 bit protected mode by turning on the first bit in the control register

    jmp CODE_SEG:init_pm ;perform a far jump which will force the cpu to flush it's pipeline thus will not still have any 16 bit instructions to process

[bits 32]

; init segment registers
init_pm:
    mov ax, DATA_SEG
    mov ds, ax
    mov ss, ax
    mov es, ax
    mov fs, ax
    mov gs, ax

    mov ebp, 0x90000 ;update stack position to point at the top of the stack
    mov esp, ebp

    call BEGIN_PM



