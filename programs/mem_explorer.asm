INCLUDE libs/Irvine32.inc

.data
	str1 byte "Encontrado na posicao:",10,13
	str2 byte "Nao encontrado:",10,13
	item SDWORD -12
	vn SDWORD 18,20,35,-12,66,4,-7,100,15
.code
main PROC
LookForKey:
	mov esi, $
	mov ecx, 100
	mov ebx, 4
	mov  eax,50          
    call Delay           
	call ReadKey         
    jz   LookForKey 
	cmp dx, 'P' 
	je PrintMem
	cmp dx, '1'
	je OneByte
	cmp dx, '2'
	je TwoBytes
	cmp dx, '4'
	je FourBytes
	cmp dx,'A'
	je MoveESIBw
	cmp dx,'D'
	je MoveESIFw
	cmp dx, 'W'
	je IncECX
	cmp dx, 'S'
	je DecECX
	cmp dx,'R'
	je	DumpReg
	cmp dx, VK_ESCAPE
    jne LookForKey    ; no, go get next key.
	exit
DumpReg:
	call DumpRegs
	jmp LookForKey
MoveESIFw:
	inc esi
	jmp LookForKey
MoveESIBw:
	dec esi
	jmp LookForKey
IncECX:
	inc ecx
	jmp LookForKey
DecECX:
	dec ecx
	jmp LookForKey
OneByte:
	mov ebx, 1
	jmp LookForKey
TwoBytes:
	mov ebx, 2
	jmp LookForKey
FourBytes:
	mov ebx, 4
	jmp LookForKey
PrintMem:
	call DumpMem
	jmp LookForKey
	exit
main ENDP
END main
