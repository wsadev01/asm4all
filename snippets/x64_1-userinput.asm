;-------------------------------------
;Read user input and print user input
;-------------------------------------

section .bss
	buf: resb 20

section .text

section .data
	nl:	db 0xd,0xa,'$'
	Msg: db 'User input is: ',0x0
	lMsg: equ $-Msg

global _start

_start:
	xor rax, rax ; Obtain user input (use xor rax rax over mov rax, 0. It is a shorter instruction)
	mov rdi, 0   ; remember the order of register to put the argument properly
	mov rsi, buf ; aaand, the syscall of stdin is 0, (in rax we store the syscall number)
	mov rdx, 20  ; if you enter more than 20 characters it crashes, yes, thats the max buffer...
	syscall
	mov rax, 1
	mov rdi, 1
	mov rsi, Msg
	mov rdx, lMsg
	syscall
	mov rax, 1
	mov rdi, 1
	mov rsi, buf
	mov rdx, 20
	syscall
	mov rax, 1
	mov rdi, 1
	mov rsi, nl
	mov rdx, 1
	syscall
	mov rax, 60
	mov rdi, 0
	syscall
