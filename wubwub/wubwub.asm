T:
out 0x61,al
X:
inc ax
jnz Z
ror dx,cl
Z:
xor ax,dx
sub al,ah
ja X
inc cx
jmp T
