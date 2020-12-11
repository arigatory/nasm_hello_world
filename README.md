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

## Main macro
- **PRINT** is used to print a string
- **PUTCHAR** is used for output one char, you can use 10, '\n' or one-byte register like AL, AH, BL, BH, CL, CH, DL and DH. Don't use other registers for this! You can also use [address]
- **GETCHAR** read one char from standard input to EAX. If Ctrl-D in input stream, EAX becomes -1 = FFFF FFFF
- **FINISH** ends execution of the program, you can add parameter which represens the code of completion, usually 0
