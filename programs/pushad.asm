include libs/Irvine32.inc

; popad edi,esi,ebp,ebx,edx,ecx,eax
; pushad eax,ecx,edx,ebx,dbp,esi,edi
.code
main PROC
	; nesta ordem
	mov eax, 10h
	mov ecx, 20h
	mov edx, 30h
	mov ebp, 40h
	mov esi, 50h
	mov edi, 60h
	pushad
	mov ecx, 6
	L1:
		pop eax
		call Crlf
		call WriteHex
		call Crlf
		loop L1

	call DumpRegs
	call WaitMsg
	exit
main ENDP
end main
