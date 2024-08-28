;
; Bellek erişimi yapan kod
;

mov ah, 0x0e

; Deneme 1
; Burada the_secret label'ının tuttuğu adresi değerini yazdırdık.
; Özetle X değerinin bulunduğu adresi yazdırdık.
mov al, the_secret
int 0x10

; Deneme 2
; Burada the_secret label'ının gösterdiği değeri yazdırdık.
; Ama küçük bir sorun var. Boot Sector'unun adresi "0x7c00" lakin
; default olarak [0:the_secret] olduğundan burada sıkıntı verdi.
; Eğer ki [0x7c0:the_secret olsaydı doğru değeri verirdi.
; [Segment:Offset]
; Bu konuyu anlamadıysak assembly memory access konusu inceleyin.
mov al, [the_secret]
int 0x10

; Deneme 3
; Burada bx register'ına the_secret adresini veriyoruz.
; Daha sonra 0x7c00 değerinde offset ediyoruz.
; Böylelikle bellekte X değerine erişiyoruz.
mov bx, the_secret
add bx, 0x7c00
mov al, [bx]
int 0x10

; Deneme 4
; Burada ise doğrudan X değerinin adresini yazıyoruz;
; Dinamik olarak kullanılamaz.
mov al, [0x7c1d]
int 0x10

; Sonsuz döngü
jmp $

; the_secret bellekte X'in yerini gösteriyor.
the_secret:
    db "X"

; 0 ile doldurma ve sihirli sayı
times 510-($-$$) db 0
dw 0xaa55

; Daha iyi anlamak için Segment ve Offset konularına bakınız.