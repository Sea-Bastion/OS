[org 0x7c00]

mov bp, 0x8000
mov sp, bp

mov bx , 0x9000
mov dh, 2

call disk_load

mov dx, [0x9000]
call printSHex

call print_nl

mov dx, [0x9000 +512]
call printSHex

jmp $



%include 'source/disk_load.asm'

times 510-($-$$) db 0
dw 0xaa55

times 256 dw 0xabcd
times 256 dw 0xef12
