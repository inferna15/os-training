int my_function() {
    return 0xbaba;
}

// Derlerken object dosyasını elde etmek için
// gcc -ffreestanding -c basic.c -o basic.o

// Object dosyasını görütülemek için
/*
inferna@hp:~/Projects/os-training$ objdump -d basic.o

basic.o:     file format elf64-x86-64


Disassembly of section .text:

0000000000000000 <my_function>:
   0:   f3 0f 1e fa             endbr64             // İntel güvenlik komutu başarılı şekilde fonksiyonun çağrılıp çağrılmadını kontrol ediyor
   4:   55                      push   %rbp         
   5:   48 89 e5                mov    %rsp,%rbp
   8:   b8 ba ba 00 00          mov    $0xbaba,%eax // 0xbaba değerini eax register'ına yükleyerek return ediyor
   d:   5d                      pop    %rbp
   e:   c3                      ret
*/

// ld -o basic.bin -Ttext 0x0 --oformat binary basic.o

// ndisasm -b 32 basic.bin > basic.dis