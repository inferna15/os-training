;
; Hello yazdıran boot sector kodu
;

; Burada ah register'ına "0x0e" değerini vermemizin sebebi birazdan gelecek olan 
; "int 0x10" interruptı için hazırlıktır.
; "int 0x10" komutu geldiğinde ax register'ına bakar ve ah kısmında hangi mod'da olduğu
; al kısmında da değeri kullancağını anlar.
; 0x0e TTY modu anlamına gelir. 
mov ah, 0x0e

mov al, 'H'
int 0x10        ; H değerini yazdırdı.

mov al, 'e'
int 0x10        ; e değerini yazdırdı.

mov al, 'l'
int 0x10        ; l değerini yazdırdı.
int 0x10        ; l değerini yazdırdı.

mov al, 'o'
int 0x10        ; o değerini yazdırdı.

; Sonsuz döngü
jmp $

; 0 ile doldurma ve sihirli sayı
times 510-($-$$) db 0
dw 0xaa55

; xxd boot-hello.bin 
; komutuyla binary formatına bakabilirsiniz.