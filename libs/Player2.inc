.data
	p2_x byte 60
	p2_y byte 12
	p2_dir byte 2
	p2_color DWORD 0
	p2_status byte 1
	p2_you_died byte "Jogador 2 vc perdeu",10,13,"Score final:",0
.code
print_p2 PROC
	call set_pos2
	mov eax,p2_color
	call SetTextColor
	.if p2_dir == 1
		mov  al, cima	
	.endif
	.if p2_dir == 2
		mov  al, esquerda	
	.endif
	.if p2_dir == 3
		mov  al, baixo
	.endif
	.if p2_dir == 0
		mov  al, direita	
	.endif
    call WriteChar
	ret
print_p2 ENDP

set_pos2 PROC
	; largura * y + x
	movzx eax, p2_y
	mov ebx, max_x
	mul ebx
	movzx ecx, p2_x
	add eax, ecx
	.if eax <= 1280
		mov esi, eax
		mov bh, field[esi]	
		.if bh == 01h
			mov p2_status, 0
		.else
			mov field[esi], 01h
		.endif
	.endif
	ret	
set_pos2 ENDP

get_p2 PROC
	cmp dx,VK_UP
	jne next1
	mov p2_dir, 1
	next1:
	cmp dx, VK_LEFT
	jne next2
	mov p2_dir, 2
	next2:
	cmp dx, VK_RIGHT
	jne next3
	mov p2_dir, 0
	next3:
	cmp dx, VK_DOWN
	jne next4
	mov p2_dir, 3
	next4:
	ret
get_p2 ENDP

step_p2 PROC
	cmp p2_dir,1
	jne next1
	dec p2_y
	next1:
	cmp p2_dir,2
	jne next2
	dec p2_x
	next2:
	cmp p2_dir,3
	jne next3
	inc p2_y
	next3:
	cmp p2_dir,0
	jne next4
	inc p2_x
	next4:
	mov  dl,p2_x
	mov  dh,p2_y
	call Gotoxy
	ret
step_p2 ENDP

check_p2 PROC
	.if p2_x >= max_x
		mov p2_status,0
	.endif
	.if p2_y > max_y
		mov p2_status,0
	.endif
	ret
check_p2 ENDP

show_score_p2 PROC
	mov  eax,white+(black*16)
	call SetTextColor
	call ClrScr
	mov edx,offset p2_you_died
	call WriteString
	movzx eax, score
	call WriteDec
	call Crlf
	ret
show_score_p2 ENDP

loss_p2 PROC
	ret
loss_p2 ENDP

