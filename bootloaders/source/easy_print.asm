[org 0x7c00]

mov ah, 0x0e

mov si, var1


printSI:
	lodsb
	
	cmp al, 0xeb
	je end

	int 0x10
	jmp printSI

var1:
	db 'Hello Sebastian,'
	dw 0x0a0a
	db 'welcome back'

end:
	jmp $

	times 510-($-$$) db 0
	dw 0xaa55
