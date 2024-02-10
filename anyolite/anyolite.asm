mov al,0x13
int 0x10
push 0xa000
pop ds

; palette code by TomCat!
inc cx
mov dx,0x3C9
L1:
push 0x18
push 0x40
push ax
L2:
pop ax
add ax,cx
cbw
xor al,ah
shr al,1
out dx,al
cmp di,sp
jne L2
loop L1

M:
mov ax,0xcccd ; rrrola's trick
mul di
sbb dl,bl
add bl,bh
rcl dx,1
xor dh,bl
xor dx,bx
sbb dh,dl
ja D
inc word [di] ; update pix
D:
inc di
jne M
inc bx ; frame counter
in al,60h ; esc check
dec al
jnz M
ret
