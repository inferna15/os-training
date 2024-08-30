int callee_function(int my_arg) {
    return my_arg;
}

void caller_function() {
    callee_function(0xdede);
}

/*
inferna@hp:~/Projects/os-training/14- Calling Function$ objdump -d calling-function.o

calling-function.o:     file format elf64-x86-64


Disassembly of section .text:

0000000000000000 <callee_function>:
   0:   f3 0f 1e fa             endbr64
   4:   55                      push   %rbp
   5:   48 89 e5                mov    %rsp,%rbp
   8:   89 7d fc                mov    %edi,-0x4(%rbp)
   b:   8b 45 fc                mov    -0x4(%rbp),%eax
   e:   5d                      pop    %rbp
   f:   c3                      ret

0000000000000010 <caller_function>:
  10:   f3 0f 1e fa             endbr64
  14:   55                      push   %rbp
  15:   48 89 e5                mov    %rsp,%rbp
  18:   bf de de 00 00          mov    $0xdede,%edi
  1d:   e8 00 00 00 00          call   22 <caller_function+0x12>
  22:   90                      nop
  23:   5d                      pop    %rbp
  24:   c3                      ret
*/