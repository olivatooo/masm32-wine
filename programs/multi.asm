include libs/Irvine32.inc

.code
main PROC
	mov al, 11110000b
	ror al, 4
	call WriteBin
	call Crlf
	call WaitMsg
	ret
main ENDP
end main
