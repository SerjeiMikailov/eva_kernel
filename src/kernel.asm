bits 32		
section .text
	;multiboot
	align 4
	dd 0x1BADB002	; magic number		
	dd 0x00				
	dd - (0x1BADB002 + 0x00) ; checksum

global start
extern k_main	

start:
	cli	;block interrupts
	call k_main
	hlt	;halt the CPU
