[org 0x7c00]

mov ah, 0x0e ; tty

; mov al, the_secret
; int 0x10

mov al, [the_secret]
int 0x10

mov bx, the_secret
add bx, 0x7c00
mov al, [bx]
int 0x10

mov bx, 0x29 ; 0x28 = 40
add bx, 0x7c00
mov al, [bx]
int 0x10

mov al, [0x7c01]
int 0x10

jmp $ ;inf loop

the_secret:
    db "X"
    db "Y" 

times 510-($-$$) db 0

dw 0xaa55