disk_load:
    push dx 

    mov ah, 0x02 ; BIOS read sector function
    mov al, dh ; Read DH sectors
    mov ch, 0x00 ; Read cylinder 0
    mov dh, 0x00 ; Select head 0
    mov cl, 0x02 ; Start reading from second sector (i.e after the boot sector)
    
    int 0x13 ; call the disk read routine

    jc disk_error

    pop dx ;restore dx and check if the read number of sectors matches the expected number
    cmp dh, al
    jne disk_error
    ret



disk_error:
    mov bx, DISK_ERROR_MSG
    call print_string
    jmp $

DISK_ERROR_MSG: db "Disk eead error!", 0