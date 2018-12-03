.data
	p1_x byte 12
	p1_y byte 12
	p1_dir byte 0 
	p1_color DWORD 0
	p1_status byte 1
	p1_you_died byte "Jogador 1 vc perdeu",10,13,"Score final:",10,13,0
	press_esc byte "Aperte ESC para sair",10,13,0
.code
print_p1 PROC
	call set_pos1
	mov eax,p1_color
	call SetTextColor
	.if p1_dir == 1
		mov  al, cima	
	.endif
	.if p1_dir == 2
		mov  al, esquerda	
	.endif
	.if p1_dir == 3
		mov  al, baixo
	.endif
	.if p1_dir == 0
		mov  al, direita	
	.endif
    call WriteChar
	ret
print_p1 ENDP

set_pos1 PROC
	; largura * y + x
	movzx eax, p1_y
	mov ebx, max_x
	mul ebx
	movzx ecx, p1_x
	add eax, ecx
	.if eax <= 1280
		mov esi, eax
		mov bh, field[esi]
		.if bh == 01h
			mov p1_status, 0
		.else
			mov field[esi], 01h
		.endif
	.endif
	ret	
set_pos1 ENDP

get_p1 PROC
	cmp dx,'W'
	jne next1
	mov p1_dir, 1
	next1:
	cmp dx, 'A'
	jne next2
	mov p1_dir, 2
	next2:
	cmp dx, 'D'
	jne next3
	mov p1_dir, 0
	next3:
	cmp dx, 'S'
	jne next4
	mov p1_dir, 3
	next4:
	ret
get_p1 ENDP

step_p1 PROC
	cmp p1_dir,1
	jne next1
	dec p1_y
	next1:
	cmp p1_dir,2
	jne next2
	dec p1_x
	next2:
	cmp p1_dir,3
	jne next3
	inc p1_y
	next3:
	cmp p1_dir,0
	jne next4
	inc p1_x
	next4:
	mov  dl,p1_x
	mov  dh,p1_y
	call Gotoxy
	ret
step_p1 ENDP

check_p1 PROC
	.if p1_x >= max_x
		mov p1_status,0
	.endif
	.if p1_y > max_y
		mov p1_status,0
	.endif
	ret
check_p1 ENDP

show_score PROC
	mov  eax,white+(black*16)
	call SetTextColor
	call ClrScr
	mov edx,offset p1_you_died
	call WriteString
	movzx eax, score
	call WriteDec
	call Crlf
	ret
show_score ENDP

loss_p1 PROC
	ret
loss_p1 ENDP

