X:
dec ah
jnz Z
xchg ax,cx
; dec cx
; add ch,cl
Z:
ror ax,cl
cmp cl,al
jb X
out 0x61,al
Q:
dec bl
jne Q
jmp X
