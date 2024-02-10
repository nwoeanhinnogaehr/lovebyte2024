; assembles with nasm

bits 32
db "cp $0 /tmp/!;sed -i 1d $_;$_|aplay -c4 -r44",10
org $25430000-($-$$)
top:
    db $7F,"ELF" ; e_ident
    dd 1 ; p_type
    dd 0 ; p_offset
    dd top ; p_vaddr
    dw 2 ; e_type, p_paddr
    dw 3 ; e_machine
    dd entry; e_version, p_filesz
    dw entry-top ; e_entry, p_memsz
entry:
    inc ebx ; file descriptor
main:
    and eax,strict dword 4 ; output a sample as long as the 4 bit is set
    mov ecx,esp ; pointer to audio data (the top byte of the stack)
    mov edx,eax ; number of bytes to write
    int 0x80 ; hit it

    inc esi ; increment time
    mov edx,esi
    mov ebp,0x10020 ; nop, skips part of ELF header
    pop ecx ; grab previous sample
    shr edx,6
    rcl ecx,3
    or ecx,edx 
    rcr edx,cl
    rcl ecx,cl
    and ecx,edx
    ; inc ecx ; uncomment for variant
    xor ch,cl
    push ecx ; push new sample
    rol ecx,cl
    xchg eax,ecx
    jmp main
