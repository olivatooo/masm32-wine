include libs/Irvine32.inc
include libs/Player1.inc
include libs/Player2.inc
include libs/Menu.inc
;include libs/Singleplayer.inc
;include libs/Multiplayer.inc

.data
	direita byte ">",0
	esquerda byte "<",0
	cima byte "^",0
	baixo byte "v",0
	score word 0
	mode word 0
	; Game configs
	max_x = 80
	max_y = 26
	field byte max_x dup (max_y dup (0))
	singleplayer_speed word 250
	multiplayer_speed word 200

.code
main PROC
	call menu
	exit
main ENDP

Singleplayer_Game PROC
	call ClrScr
	call WaitMsg
	call ClrScr
	Singleplayer:
		movzx  eax,singleplayer_speed
		call Delay
		call ReadKey
		call get_p1
		call step_p1
		call check_p1
		call print_p1
		inc score
		.if singleplayer_speed > 20
			sub singleplayer_speed,5
		.endif
		cmp p1_status,0
		jne Singleplayer
		call show_score
		ret
Singleplayer_Game ENDP

Multiplayer_Game PROC
	call ClrScr
	call WaitMsg
	call ClrScr
	Multiplayer:
		movzx  eax,multiplayer_speed
		call Delay
		call ReadKey
		call get_p1
		call get_p2
		call check_p1
		cmp p1_status,0
		je Perdeu1
		call step_p1
		call print_p1
		call check_p2
		cmp p2_status,0
		je Perdeu2
		call step_p2
		call print_p2
		jmp Multiplayer
	Perdeu1:
		call show_score
		ret
	Perdeu2:
		call show_score_p2
		ret
Multiplayer_Game ENDP

reset PROC
	mov p1_x,12
	mov p1_y,12
	mov p1_dir,0 
	mov p1_status, 1
	mov score, 0
reset ENDP
end main
