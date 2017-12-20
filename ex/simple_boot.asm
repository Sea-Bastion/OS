[org 0x7c00]

mov ah, 0x0e

mov si, text

call printSI

jmp $

%include "asm/easy_print.asm"


text:
	db 'Hello Sebastian, '
	dw 0x0a0a
	db 'welcome back', 0


times 510-($-$$) db 0

dw 0xaa55
