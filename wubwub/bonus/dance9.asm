X:
inc ax
jnz Z
inc bx
Z:
; sub ah,bl
xor al,bl
sub al,ah
jg X
out 0x61,al
jmp X
