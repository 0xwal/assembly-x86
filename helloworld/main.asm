section	.text ;this (.text) section is executable area that contains our functions



   global _start ;(global is NASM specific)
;(global) directive will include the name or the symbol in the object to make it
;visible for the linker to specify the entry point of an executable, usually _start is the default entry point for GNU linker








print: ;(Procedure/Subroutine name:) (cdecl=C declaration) https://en.wikipedia.org/wiki/X86_calling_conventions#cdecl
    push ebp        ;)
                    ;|-->  prologue for function to save the (ebp) for the previous (caller) which is (_start), also (ebp) is considered as our current base for this (stack frame/function); actully we don't need it at this time because we don't push any value into the stack
    mov ebp, esp    ;)


    mov eax, 4
    mov ebx, 1
    mov edx, [ebp+0xC]
    mov ecx, [ebp+0x8]
    int 0x80 ;syscall(eax, ebx, ecx, edx)



    pop ebp         ;|--> Epilogue : we pop the (ebp) direct without cleaning the stack from our local variable OR callee arguments, as you see the code, we don't mess the stack :)

    ret ;(ret) indicates the end of the Procedure


_start: ;(Procedure/Subroutine name:) : this _start is global and it's the entry point for the app
    push len
    push msg
    call print
    add esp, 0x8
    mov	eax,1
    int	0x80








section	.data ;(.data) is the data section for all variable OR members that got assigned a value also will be included in the program image
; it has the Access & Write permissions
; data length depends on the size of the given keyword (db,dw,dd...) OR the value itself.

msg db 'Hello, world!', 0xa
len equ $ - msg
