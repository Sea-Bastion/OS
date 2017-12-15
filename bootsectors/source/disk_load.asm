disk_load:
	pusha
	push dx

	mov ah, 0x02
	mov al, dh
	mov cl, 0x02

	mov ch, 0x00
	mov dh, 0x00

	int 0x13
	jc disk_error


	pop dx

	cmp al, dh
	jne sector_error
	popa
	ret


disk_error:
	mov si, DISK_ERROR
	call printS
	call print_nl
	push ax
	ror ax, 4
	and ax, 0x00ff
	mov si, ax
	pop ax
	call printSHex
	jmp end_loop

sector_error:
	mov si, SECT_ERROR
	call printS
	jmp end_loop

DISK_ERROR: db 'Error reading disk', 0

SECT_ERROR: db 'Incorrect number of sectors read', 0

end_loop:
	jmp $

%include 'source/easy_print.asm'
