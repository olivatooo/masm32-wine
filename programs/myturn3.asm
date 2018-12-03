include libs/Irvine32.inc

.data
	source byte "ABCDE"
	target byte "a", lengthof source dup (?)

.code
main PROC
	cld
	mov ecx, lengthof array
	mov edi, offset array
	mov ax, 0100h
	repne scasw
	je sim
	jmp fim
	sim:
	mov eax, edi
	call Crlf
	call WriteDec
	call Crlf
	call WaitMsg
	fim:
	exit
main ENDP
END main
