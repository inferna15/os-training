void main() {
    // Video belleğinin bellekte bulunduğu adres bu adres ekranın sol üst köşesindeki karateri gösterir.
    char* video_memory = (char*) 0xb8000;

    // Ekranın sol üst köşesine X yazdır.
    *video_memory = 'X'; 
}

/*
Derleme komutları
$gcc -m32 -ffreestanding -fno-pic -c kernel.c -o kernel.o
$ld -m elf_i386 -o kernel.bin -Ttext 0x1000 kernel.o --oformat binary -e _start
*/

// 2. komutta 0x1000 adresinde olduğunu belirttik boot sektörde b adresten çağıracağız.

/*
İşletim sistemi oluştururken uygulayacağımız adımlar:
• Write and compile the kernel code.
• Write and assemble the boot sector code
• Create a kernel image that includes not only our boot sector but our compiled kernel code
• Load our kernel code into memory
• Switch to 32-bit protected mode
• Begin executing our kernel code
*/

// cat boot-sect.bin kernel.bin > os-image         -> boot sektör ve kernel binary'lerini tek dosyaya yaz
// dd if=/dev/zero of=floppy.img bs=512 count=2880 -> Tamamen 0'lardan oluşan bir floopy image oluştur
// dd if=os-image of=floppy.img conv=notrunc       -> os-image dosyasını floopy image yaz
// qemu-system-i386 -fda floppy.img -boot a        -> Çalıştır.