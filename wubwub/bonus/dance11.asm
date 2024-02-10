T:
out 0x61,al
X:
inc ax
jnz Z
ror dx,cl
; dec dx
; js Z
; dec cx
xchg cx,dx
Z:
xor ax,dx
sub al,ah
ja X
jmp T
