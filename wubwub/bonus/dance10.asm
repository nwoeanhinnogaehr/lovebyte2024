X:
inc ax
jnz Z
dec dx
rol dx,1
Z:
xor ax,dx
sub al,ah
jge X
out 0x61,al
jmp X
