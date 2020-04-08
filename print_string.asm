print_hex:
    pusha 
    
    mov bh, dh    
    shr bh, 4    
    mov cl, 2    
    call print_hex_put_nibble

    mov bh, dh    
    and bh, 0x0f
    mov cl, 3     
    call print_hex_put_nibble

    mov bh, dl
    shr bh, 4
    mov cl, 4
    call print_hex_put_nibble

    mov bh, dl
    and bh, 0x0f
    mov cl, 5
    call print_hex_put_nibble

    mov bx, HEX_OUT
    call print_string   

    popa
    ret

print_hex_put_nibble:
    pusha    

    cmp bh, 0x9
    jg print_hex_letter_mask

    print_hex_number_mask:
        or bh, 0x30    
        jmp print_hex_insert_char
    
    print_hex_letter_mask:
        sub bh, 9
        or bh, 0x60            

    print_hex_insert_char:
        mov al, bh
        mov bx, HEX_OUT
        add bl, cl
        mov [bx], al
    popa
    ret 



print_string:
    pusha ; store all register values on the stack

    mov ah, 0x0e ; prepare to print tty
    print_loop:
        mov al, [bx] ; move character at bx into print register
        int 0x10 

        add bx, 0x01
        cmp al, 0x0
        jne print_loop
    popa ; load all register values from the stack back into the registers
    ret ; return to ip address that should now be on the stack

HEX_OUT: db '0x0000', 0