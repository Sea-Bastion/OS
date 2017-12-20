[bits 32]

VRAM equ 0xb8000
bg equ 0x0f

print32:
	pusha

	mov edx, VRAM	

	add edx, eax

print32loop:
	mov al, [ebx]
	mov ah, bg

	cmp al, 0
	je print32end
	
	mov [edx], ax

	add ebx, 1
	add edx, 2
	jmp print32loop

print32end:
	popa
	ret
