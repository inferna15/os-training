;
; Stack kullanma örneği
;

mov ah, 0x0e

; bp => Stack Base Pointer
; sp => Stack Top Pointer
; Stack'i 0x8000 adresine yerleştirdik.
mov bp, 0x8000
mov sp, bp

; Stack' push ediyoruz.
push 'A'
push 'B'
push 'C'

; push ve pop işlemleri 16-bit veri ile olur.
; Bu yüzden bx register'ını kullandık.
pop bx
mov al, bl
int 0x10

pop bx
mov al, bl
int 0x10

mov al, [0x7ffe] ; 0x8000 - 0x0002 = 0x7ffe
int 0x10

; Sonsuz döngü
jmp $

; 0 ile doldurma ve sihirli sayı
times 510-($-$$) db 0
dw 0xaa55
