hex2ascii:
	pusha

	mov cx, 0

loop:

	cmp cx, 4
	jge end

	mov ax, dx
	and ax, 0x000f
	add al, 0x30
	cmp al, 0x39
	jle hex2
	add al, 7

hex2:
	
	mov bx, HEXOUT + 5
	sub bx, cx
	mov bx, al
	ror dx, 4
	add cx, 1
	jmp loop


end: 
	popa
	mov dx, HEXOUT
	ret

HEXOUT: db '0x0000', 0
