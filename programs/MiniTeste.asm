include libs/Irvine32.inc

.data
	source DWORD 0ABCD1234h
	target DWORD ?
	;
	big_source byte "BAT "
	big_target byte 20 dup (?)
.code
main PROC
	; Moving data (memset)
	mov esi, offset source
	mov edi, offset target
 	movsd
	mov eax, target
	call WriteHex
	call Crlf
	call WaitMsg
	call Crlf
	mov ecx, lengthof big_source
	mov esi, offset big_source
	mov edi, offset big_target
	rep movsd
	mov edx, offset big_target
	call WriteString
	call Crlf
	call WaitMsg
	exit
main ENDP
END main
