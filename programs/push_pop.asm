include libs/Irvine32.inc

.data
	count byte, 0
.code
main PROC
	mov ecx, 10	;set outer loop count
	L1:
		push ecx	;save outer loop count
		mov ecx, 10 	;set inner loop count
		mov eax, ecx
		call Crlf
		call WriteInt
		call Crlf
		L2:
			mov eax, ecx
			call WriteInt
			mov eax, 10
			call Delay
			push ecx
			mov ecx, 2
			L3:
				call Crlf
				mov eax, ecx
				call WriteInt
				call Crlf
				loop L3
			pop ecx
			loop L2
		pop ecx
		loop L1
	call WaitMsg
	exit
main ENDP
END main
