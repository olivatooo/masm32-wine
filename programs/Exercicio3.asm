include libs/Irvine32.inc

.data
	source byte "ABC",0
	target byte "Esther te amo ",10 dup (0)

.code


concat PROC
	mov al, 0
	mov ecx, lengthof target
	mov edi, offset target
	repne scasb
	dec edi
	mov esi, offset source
	mov ecx, (lengthof source)-1
	keep:

		lodsb
		stosb
		loop keep
	ret
concat ENDP

main PROC
	call concat
	mov edx, offset target
	call WriteString
	call Crlf
	call WaitMsg
	exit
main ENDP
END main
