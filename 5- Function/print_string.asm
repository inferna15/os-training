print_string:
    mov ah, 0x0e
    mov al, [bx]
    cmp al, 0
    je end
    int 0x10
    inc bx
    jmp print_string
end:
    ret