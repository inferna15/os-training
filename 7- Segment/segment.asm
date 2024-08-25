mov ah, 0x0e

; ds => 0
mov al, [the_secret]
int 0x10

; ds => 0x7c0
mov bx, 0x7c0
mov ds, bx
mov al, [the_secret]
int 0x10

; es => 0
mov al, [es:the_secret]
int 0x10

; es => 0x7c0
mov bx, 0x7c0
mov es, bx
mov al, [es:the_secret]
int 0x10

jmp $

the_secret:
    db "X"

times 510-($-$$) db 00
dw 0xaa55