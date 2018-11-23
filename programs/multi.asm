include libs/Irvine32.inc

.data
	batata byte 2
	repolho byte 3
.code
main PROC
	mov eax, 3
	mul repolho
	call WriteDec
	call Crlf
	call WaitMsg
	ret
main ENDP
end main
