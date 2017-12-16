[bits 32]

VRAM equ 0xb8000
bg equ 0x0f

print32:
	pusha

	mov edx, VRAM

printloop:
	mov al, [ebx]
	mov ah, bg

	cmp al, 0
	je end
	
	mov [edx], ax

	add ebx, 1
	add edx, 2
	jmp printloop

end:
	popa
	ret
