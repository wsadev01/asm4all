;-----------------------------
;Hello world (Write function)
;------------------------------
global _start

section .text

_start:
	mov rax, 1	; in ax register, we stores the systemcall (1 is write in x64)
	mov rdi, 1	; the parameters goes in rdi, rsi, rdx, rcx, r8 and r9, if you can, in that order.
	mov rsi, msg; "Hello World!\n"
	mov rdx, len; the size of the string
	syscall
	mov rax, 60	; call exit check the /
	mov rdi, 0  ; 
	syscall     ; 

section .rodata
msg: db 'Hello World!',0xa 	;string plus the \n (0xa means \n in hex)
len: equ $ - msg		   	;length of the string
