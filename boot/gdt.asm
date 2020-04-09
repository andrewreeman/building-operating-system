; Define the Global Descriptor Table

gdt_start:

gdt_null: ; the mandatory null descriptor that must the first entry in the gdt table. This is a trap
          ; that will cause an interupt if access. This is to avoid accidental unassignment of properties
          ; when accessing the gdt
    dd 0x0 ; the first 4 bytes of an entry
    dd 0x0 ; the second 4 bytes of an entry

gdt_code: ; the code segment descriptor
    dw 0xffff ; Limit (bits 0-15)
    dw 0x0 ; Base (bits 0-15)
    dw 0x0 ; Base bits (16-23)
    db 10011010b ; 1st flags, type flags
    db 11001111b ;2nd, Limit (bits 16-19)
    db 0x0 ; Base (bits 24-31)

gdt_data: ; the data segment descriptor
    ; same as above but change the type flag
    dw 0xffff
    dw 0x0 
    dw 0x0 
    db 10010010b ; type flag is zero here for data
    db 11001111b 
    db 0x0 

gdt_end: ; The end of the GTC table. Used for size calculation for the gdt descriptor

gdt_descriptor:
    dw gtd-end - gtd-start - 1 ; size of gdt
    dd gdt_start ; start address of gdt

CODE_SEG equ gdt_code - gdt_start
DATA_SEG equ gdt_data - gdt_start

        