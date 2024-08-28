[bits 16]
; Switch to protected mode
switch_to_pm:
    ; Kesme bayrağını 0 yaparak interrupt'ları devre dışı bırakır.
    ; Sistem 32-bit korumalı moda geçerken hata vermesin diye interruptar durdurulur.
    cli ; Clear Interrupt Flag

    lgdt [gdt_descriptor]   ; 10. kısımda yazdığımız gdt veri yapısını yüklüyoruz.

    ; cr0 registerının ilk bitini set ederek 32 bite geçtiğini belirttik.
    mov eax, cr0    
    or eax, 0x1
    mov cr0, eax

    ; Burada jump etmemizin sebebi jump komutu çalıştığı zaman eş zamanlı olarak 
    ; başka bir komutun çalıştırılmaya çalışılmadığından emin oluyoruz.
    jmp CODE_SEG:init_pm

[bits 32]

init_pm:
    mov ax, DATA_SEG    ; Segment register'ları GDT yapısına göre ayarlandı.
    mov ds, ax
    mov ss, ax
    mov es, ax
    mov fs, ax
    mov gs, ax

    mov ebp, 0x90000    ; Stack pozisyonu ayarlanıyor.
    mov esp, ebp

    call BEGIN_PM