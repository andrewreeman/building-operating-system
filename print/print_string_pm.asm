[bits 32]

; define VIDEO_MEMORY address
VIDEO_MEMORY equ 0xb8000
WHITE_ON_BLACK equ 0x0f

; prints a null terminated string pointed to by EBX
print_string_pm:
    pusha
    mov edx, VIDEO_MEMORY ; set edx to start of video memory

print_string_pm_loop:
    mov al, [ebx] ; store the char at ebx 
    cmp al, 0
    je done

    mov ah, WHITE_ON_BLACK ; store attribute in high byte
    mov [edx], ax ; store char and attribute at video memory address

    add ebx, 1 ; get next char to print
    add edx, 2 ; move to next character cell in video memory


done:
    popa
    ret

    
