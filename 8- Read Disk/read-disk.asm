[org 0x7c00]

mov ah, 0x02 ; BIOS read sector function

mov dl, 0 ; 1. disket sürücüsünü seç (drive 0)

mov ch, 3 ; 3. silindiri seç
mov dh, 1 ; 2. kafayı seç (diskin ikinci yüzeyi)

mov cl, 4 ; 4. sektörü seç

mov al, 5 ; 5 sektör oku

mov bx, 0xa000
mov es, bx      ; Segment
mov bx, 0x1234  ; Offset

; Belirtilen sektörleri okur ve es:bx adresine yazar.
int 0x13

; ah => işlev kodu (0x02 -> sektör okuma)
; al => okunacak sektör yazısı
; ch => silindir numarası
; cl => sektör numarası
; dh => kafa numarası
; dl => sürücü numarası
; es => bellekte verinin okunacağı adres (segment)


; Eğer okuma sırasında hata oluşursa carry flag set olur.
jc disk_error

; Gerçekten 5 sektör okunup okunmadığı kontrol ediliyor.
cmp al, 5
jne disk_error

jmp $

disk_error:
    mov bx, DISK_ERROR_MSG
    call print_string
    jmp $

%include "../5- Function/print-string.asm"

DISK_ERROR_MSG: 
    db "Disk read error!", 0

times 510-($-$$) db 0
dw 0xaa55