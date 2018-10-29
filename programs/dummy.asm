include libs/Irvine32.inc

.code
main PROC
mov al, 10000001b
test al, 1h
jz se_o_ultimo_for_0
jmp ultimo_1
se_o_ultimo_for_0:
	shr al, 1
	jmp next
ultimo_1:
	shr al , 1
	call WriteInt
	or al, 80h
next:
	call WriteBin
	call Crlf
	call WaitMsg
	exit
main ENDP
end main
	;kkkkk LOGICO
