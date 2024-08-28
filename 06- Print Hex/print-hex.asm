[org 0x7c00]

mov dx, 0x1fb6
call print_hex

jmp $

; dx register'ındaki değeri ascii olarak yazdırır.
print_hex:
    push dx
    mov bx, HEX_OUT + 6
    first:
        cmp dx, 0
        je last
        mov cx, dx
        and cx, 0x000f
        call hex
        mov [bx], cl
        add bx, -1
        shr dx, 4
        jmp first
    last:
    pop dx
    mov bx, HEX_OUT
    call print_string
    ret

hex:
    cmp cl, 9
    jbe num
    jmp let

num:
    add cl, '0'
    ret

let:
    add cl, 'A' - 10
    ret

%include "../5- Function/print-string.asm"

HEX_OUT: 
    db "0x0000", 0

times 510-($-$$) db 0
dw 0xaa55