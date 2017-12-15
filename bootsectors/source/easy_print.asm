[org 0x7c00]



printS:
	pusha

	mov ah, 0x0e
	lodsb
	
	cmp al, 0
	je end

	int 0x10
	jmp printS


printSHex:
	pusha
	
	mov cx, 0

Hexloop:
	cmp cx, 4
	je end

	mov ax, si
	and ax, 0x000f
	add al, 0x30
	cmp al, 0x39
	jle Hex2
	add al, 7

Hex2:
	mov bx, HEXOUT + 5
	sub bx, cx
	mov [bx], al
	ror bx, 4

	add cx, 1
	jmp Hexloop
	

end:
	popa
	ret


print_nl:
	pusha
	
	mov ah, 0x0e
	mov al, 0x0a
	int 0x10
	mov al, 0d
	int 0x10

	popa
	ret

HEXOUT: dw 0x0000
