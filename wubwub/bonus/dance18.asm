T:
out 0x61,al
X:
inc ax
jnz Z
dec cx
; jp X
; sub dx,cx
rol dx,cl
; dec cx
; js Z
; xchg cx,dx
; add dl,ah
; inc dx
Z:
xor ax,dx
sub al,ah
jnc X
jmp T
