# nasm_hello_world
samples for understanding

To compile
```
nasm -f elf hello5.asm
```

To link and make executable from object file (Ubuntu x64)
```
ld hello5.o -m elf_i386 -o hello5
```
