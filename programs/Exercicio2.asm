include libs/Irvine32.inc

.data
	array WORD 5 dup (0202h),1234h,5 dup (0303h)

.code
main PROC
	cld
	mov ecx, lengthof array
	mov edi, offset array
	mov ax, 1234h
	repne scasw
	je sim
	jmp fim
	sim:
	sub edi, 2
	mov ah, [edi]
	call Crlf
	call WriteHex
	call Crlf
	call WaitMsg
	fim:
	exit
main ENDP
END main
