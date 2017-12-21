[org 0x7c00]

KERNAL equ 0x200

mov [BOOT_DRIVE], dl
mov bp, 0x9000
mov sp, bp

mov dx, BOOT16_MSG
call printS
call print_nl

mov bx, KERNAL
mov bh, 2
mov bl, [BOOT_DRIVE]
call disk_load

call switch_to_pm
jmp $



[bits 32]
BEGIN_PM:

	mov edx, MSG_32
	call print32

	call KERNAL
	jmp $


%include '32bit-switch.asm'
%include 'disk_load.asm'
%include '32-print.asm'


MSG_32 db 'booting kernal', 0
BOOT16_MSG db 'Loading Kernal...', 0
BOOT_DRIVE db 0

times 510-($-$$) db 0
dw 0xaa55
