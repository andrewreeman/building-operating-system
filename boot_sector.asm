
mov bx, 60
cmp bx, 4
jle set_a

cmp bx, 40
jl set_b

mov al, 'C'
jmp end

set_a:
    mov al, 'A'
    jmp end

set_b:
    mov al, 'B'
    jmp end

end:
    mov ah, 0x0e
    int 0x10

jmp $ ;inf loop

times 510-($-$$) db 0

dw 0xaa55