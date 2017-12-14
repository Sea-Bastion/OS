[org 0x7c00]



printSI:
	pusha

	mov ah, 0x0e
	lodsb
	
	cmp al, 0
	je end

	int 0x10
	jmp printSI
	popa

end:
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
