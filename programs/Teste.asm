INCLUDE libs/Irvine32.inc

.data
	str1 byte "E nois irmao",10,13
	ranNum DWORD ?	
	intVal = 35
.code
main PROC
loops:
	mov eax, intVal
	call WriteBin
	call Crlf
	call WriteDec
	call Crlf
	call WriteHex
	call Crlf
	mov edx,OFFSET str1
    call WriteString
	jmp loops
	exit
main ENDP
END main
