[org 0x7c00]
	mov bp, 0x9000
	mov sp, bp

	mov dx, REAL
	call printS
	
	call switch32


%include 'asm/easy_print.asm'
%include 'asm/print32.asm'
%include 'asm/switch32.asm'


[bits 32]
INIT_32:

	mov eax, 2140

	mov ebx, PROC
	call print32

	jmp $

REAL db 'printed in real mode', 0
PROC db 'printed in proc mode', 0


times 510-($-$$) db 0
dw 0xaa55
