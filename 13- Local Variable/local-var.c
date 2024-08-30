int my_function() {
    int my_var = 0xbaba;
    return my_var;
}

/*
inferna@hp:~/Projects/os-training/13- Local Variable$ objdump -d local-var.o

local-var.o:     file format elf64-x86-64


Disassembly of section .text:

0000000000000000 <my_function>:
   0:   f3 0f 1e fa             endbr64
   4:   55                      push   %rbp
   5:   48 89 e5                mov    %rsp,%rbp
   8:   c7 45 fc ba ba 00 00    movl   $0xbaba,-0x4(%rbp) // Yerel değişkeni stack'a yerleştiriyor.
   f:   8b 45 fc                mov    -0x4(%rbp),%eax    // Stack'e yerleştirdiği değişkeni eax ile return ediyor.
  12:   5d                      pop    %rbp
  13:   c3                      ret
*/