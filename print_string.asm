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