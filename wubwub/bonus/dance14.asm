T:
out 0x61,al
X:
dec ax
jnz Z
or dx,cx
; rol dx,cl
; dec dx
; js Z
; xchg cx,dx
; add dl,ah
inc dx
Z:
xor al,dl
sub al,ah
jae X
inc cx
jmp T
