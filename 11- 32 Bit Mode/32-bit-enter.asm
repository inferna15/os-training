[org 0x7c00]

mov bp, 0x9000  ; Stack pozisyonu ayarla
mov sp, bp

mov bx, MSG_REAL_MODE
call print_string

call switch_to_pm

jmp $

%include "../05- Function/print-string.asm"
%include "../10- 32 Bit GDT/gdt-start.asm"
%include "../09- 32 Bit Print/32-bit-print.asm"
%include "32-bit-mode.asm"

[bits 32]

BEGIN_PM:
    mov ebx, MSG_PROT_MODE
    call print_string_pm

    jmp $

; Global variables
MSG_REAL_MODE db "Started in 16-bit Real Mode", 0
MSG_PROT_MODE db "Successfully landed in 32-bit Protected Mode", 0

times 510-($-$$) db 0
dw 0xaa55