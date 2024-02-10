T:
out 0x61,al
X:
inc ax
jnz Z
or dx,cx
; rol dx,cl
; dec dx
; js Z
; xchg cx,dx
; add dl,ah
inc dx
Z:
xor ax,dx
sub al,ah
jae X
inc cx
jmp T
