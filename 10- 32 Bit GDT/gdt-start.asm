gdt_start:

gdt_null:   ; Zorunlu null tanımlayıcı
    ; dd => define double word (4 bytes)
    dd 0x0
    dd 0x0

gdt_code:   ; Kod kısmı tanımlayıcı
    ; base = 0x0, limit = 0xfffff
    ; 1st flags :  ( present )     1     ( privilege )       00   ( descriptor type )   1                         -> 1001b
    ; type flags : ( code )        1     ( conforming )      0    ( readable )          1       ( accessed ) 0    -> 1010b
    ; 2nd flags :  ( granularity ) 1     (32 - bit default ) 1    (64 - bit seg )       0       ( AVL )      0    -> 1100b
    dw 0xfffff      ; Limit (bits 0-15)
    dw 0x0          ; Base  (bits 0-15)
    db 0x0          ; Base  (bits 16-23)
    db 10011010b    ; 1st flags, type flags
    db 11001111b    ; 2nd flags, Limit (bits 16-19)
    db 0x0          ; Base (bits 24-31)

gdt_data:   ; Veri kısmı tanımlayıcı
    ; type flag dışında aynı kod
    ; type flags : ( code )        0     ( expand down )     0    ( writable )          1       ( accessed ) 0    -> 0010b
    dw 0xfffff      ; Limit (bits 0-15)
    dw 0x0          ; Base  (bits 0-15)
    db 0x0          ; Base  (bits 16-23)
    db 10010010b    ; 1st flags, type flags
    db 11001111b    ; 2nd flags, Limit (bits 16-19)
    db 0x0          ; Base (bits 24-31)

gdt_end:


gdt_descriptor: ; GDT tanımlayıcı
    dw gdt_end - gdt_start - 1 ; GDT'mizin boyutu           (16 bits)
    dd gdt_start               ; GDT'mizin başlangıç adresi (32 bits)
    
; Daha sonra kullanmak için sabitler
CODE_SEG equ gdt_code - gdt_start
DATA_SEG equ gdt_data - gdt_start

; GDT
;
; GDT x86 mimarisinde korumalı modda kullanılması gereken bir segment tanımlayıcı veri yapısıdır.
; İşlemcinin bellek erişimi, izinler ve segment sınırları gibi önemli bellek yönetimi görevlerini yerine getirmesinde kritik bir rol oynar.