[org 0x7c00]
     mov [BOOT_DRIVE], dl ; store bootdrive in BOOT_DRIVE

    mov bp, 0x8000 ; 
    mov sp, bp ; set the stack safetly out of the way

    mov bx, 0x9000 ; load 5 sectors to 0x0000:0x9000 from the boot disk

    mov dh, 2
    call disk_load
     mov dl, [BOOT_DRIVE]

    mov dx, [0x9000] ; print first loaded word stored at address 0x9000
    call print_hex

    mov dx, [0x9000 + 512] ; print first loaded word in the next segment
    call print_hex

    jmp $ 

%include "../print/print_string.asm"
%include "../hex/print_hex.asm"
%include "disk_load.asm"

BOOT_DRIVE: db 0

times 510-($-$$) db 0
dw 0xaa55

; test data to populate a sector
times 256 dw 0xdada
times 256 dw 0xface