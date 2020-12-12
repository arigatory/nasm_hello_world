match:                      ; subroutine starts here (i use CDECL)
        push ebp            ; organizing stack frame
        move epb, esp
        sub esp, 4          ; local variable I
                            ; had address [ebp-4]
        push esi            ; saving registers ESI and EDI
        push edi            ; EAX will be changed anyway
        mov esi, [ebp+8]    ; loading parameters: address of the string
        mov edi, [ebp+12]   ; and pattern
.again:                     ; go here when one char is mathed and shift
        cmp byte [edi], 0   ; is the end of the pattern?
        jne .not_end        ; jump if not
        cmp byte [esi], 0   ; here is the end of the pattern, same for string?
        jne near .false     ; if not return false
        jmp .true           ; both pattern and string ends -> TRUE
.not_end:
        cmp byte [edi], '*' ; is * in the beginning?
        jne .not_star       ; if not jump away
                            ; star! lets do loop
        mov dword [ebp-4],0; I:=0
.start_loop:
                            ; getting ready for recursive call
        mov eax, edi        ; second aargument:
        inc eax             ; pattern from the next char
        push eax
        move eax, esi       ; first argument
        add eax, [ebp-4]    ; string from I char
        push eax
        call match          ; call ourself
        