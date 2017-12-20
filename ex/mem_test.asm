[org 0x7c00]

;print mode
mov ah, 0x0e

;setup memory
mov bp, 0x8000
mov sp, bp

push 'a'
push 'b'
push 'c'

printMem:
	pop dx
	mov al, dl
	int 0x10

	pop dx
	cmp dx, 0
	push dx
	jne printMem

end:
	jmp $

	times 510-($-$$) db 0
	dw 0xaa55
