include libs/Irvine32.inc
;include libs/Menu.inc
;include libs/Singleplayer.inc
;include libs/Multiplayer.inc

.data
	direita byte ">",0
	esquerda byte "<",0
	cima byte "^",0
	baixo byte "v",0
	; Player 1 Configs
	p1_x byte 12
	p1_y byte 12
	p1_dir byte 0
	p1_color byte 0
	; Player 2 Configs
	p2_x byte 24
	p2_y byte 12
	p2_dir byte 0
	p2_color byte 0
.code
	call Menu

