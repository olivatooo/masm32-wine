include libs/Irvine32.inc

.data
	str1 byte "Batata"
.code
main PROC
	mov ecx, lengthof str1
	mov esi, 0
	L1:
		mov al, str1[esi]
		and al, 11011111b
		mov str1[esi], al
		inc esi
		loop L1
	mov edx, offset str1
	call WriteString
	call Crlf
	call WaitMsg
	exit

main ENDP
end main
