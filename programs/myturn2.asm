include libs/Irvine32.inc

.data
	array WORD 5 dup (0202h),0100h,5 dup (0303h)

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
