include libs/Irvine32.inc

.data
	array1 WORD 20 dup (1)
	array2 WORD 20 dup (2)

.code
main PROC
	cld
	mov ecx, lengthof array1
	mov esi, offset array1
	mov edi, offset array2
	repe cmpsw
	jne nope
	jmp fim
	nope:
	call WaitMsg
	fim:
	exit
main ENDP
END main
