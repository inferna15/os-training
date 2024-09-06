void main() {
    // Video belleğinin bellekte bulunduğu adres bu adres ekranın sol üst köşesindeki karateri gösterir.
    char* video_memory = (char*) 0xb8000;

    // Ekranın sol üst köşesine X yazdır.
    *video_memory = 'X'; 
}

// 15. dosyadakilerle aynı

/*
İşletim sistemimiz 32-bit olacağından komutları ona göre ayarlıyoruz.

Kernel için
i386-elf-gcc -ffreestanding -c kernel.c -o kernel.o

Kernel Entry için
nasm kernel_entry.asm -f elf -o kernel_entry.o

Kernel ve kernel entry bağlamak için
i386-elf-ld -o kernel.bin -Ttext 0x1000 kernel_entry.o kernel.o --oformat binary

Boot sektör için 
nasm bootsect.asm -f bin -o bootsect.bin

os-image için
cat bootsect.bin kernel.bin > os-image

Derleme için Makefile kullanacağız.
*/