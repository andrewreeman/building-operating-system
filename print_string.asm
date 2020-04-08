print_hex:
    pusha    
    call put_first_nibble    
    call put_second_nibble

    mov bx, HEX_OUT
    call print_string   

    popa
    ret

put_first_nibble:
    pusha
    ; put first nibble
    mov bh, dh    
    shr bh, 4    

    cmp bh, 0x9
    jg letter_mask        

    number_mask:
        or bh, 0x30    
        jmp insert_char
    
    letter_mask:
        sub bh, 9
        or bh, 0x60            

    insert_char:
    mov al, bh
    mov [HEX_OUT+2], al   
    popa
    ret 

put_second_nibble:
     pusha
    ; put second nibble
    mov bh, dh    
    and bh, 0x0f
    mov cl, 3

    cmp bh, 0x9
    jg letter_mask_2 

    number_mask_2:
        or bh, 0x30    
        jmp insert_char_2
    
    letter_mask_2:
        sub bh, 9
        or bh, 0x60            

    insert_char_2:
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