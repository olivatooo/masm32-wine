.data
	texto_single byte "1. Singleplayer",0
	texto_multi byte "2. Multiplayer",0
	texto_sair byte "0. Sair",0
	texto_titulo_1 byte "   ____ _      _ _____                               ",10,13
	texto_titulo_2 byte "  / ___| | ___(_)_   _| __ ___  _ __    _____  _____ ",10,13
	texto_titulo_3 byte " | |   | |/ _ \ | | || '__/ _ \| '_ \  / _ \ \/ / _ \",10,13
	texto_titulo_4 byte " | |___| |  __/ | | || | | (_) | | | ||  __/>  <  __/",10,13
	texto_titulo_5 byte "  \____|_|\___|_| |_||_|  \___/|_| |_(_)___/_/\_\___|",10,13,0

	texto_space byte " - ",0
	texto_cor byte "Jogador, selecione a sua COR",10,13,0
	texto_multi_1 byte "Jogador 1, selecione a sua COR",10,13,0
	texto_multi_2 byte "Jogador 2, selecione a sua COR",10,13,0
	escolha DWORD ?
	promptBad BYTE "Entrada invalida!",10,13,0


.code
menu PROC
	call ClrScr
	mov edx, offset texto_titulo_1
	call WriteString
	call Crlf
	mov edx, offset texto_single	
	call WriteString
	call Crlf
	mov edx, offset texto_multi	
	call WriteString
	call Crlf
	mov edx, offset texto_sair	
	call WriteString
	call Crlf
	read:
	   call ReadDec
       jnc goodInput
	   bad:
       mov edx,OFFSET promptBad
       call WriteString
       jmp read
	goodInput:
       mov escolha,eax
	   .if escolha >2
	   		jmp bad
	   .endif
	   .if escolha == 1
	   		call singleplayer_menu	
	   .endif
	   .if escolha == 2
	   		call multiplayer_menu	
	   .endif
	ret 
menu ENDP

press_esc_exit PROC
	mov edx,offset press_esc
	call writestring
	lookforkey:
    mov  eax,50
    call delay
    call readkey       
    jz   lookforkey     
	cmp    dx,vk_escape
    jne    lookforkey
	ret
press_esc_exit ENDP

multiplayer_menu PROC
	mov edx, offset texto_multi_1
	call color_pallete
	read:
		call ReadDec
        jnc goodInput
		mov edx,OFFSET promptBad
        call WriteString
        jmp read
	goodInput:
       mov p1_color, eax
	mov edx, offset texto_multi_2
	call color_pallete
	read1:
		call ReadDec
        jnc goodInput1
		mov edx,OFFSET promptBad
        call WriteString
        jmp read1
	goodInput1:
       mov p2_color, eax
	   call Multiplayer_Game
	call press_esc_exit
	ret
multiplayer_menu ENDP

singleplayer_menu PROC
	mov edx, offset texto_cor
	call color_pallete
	read:
		call ReadDec
        jnc goodInput
		mov edx,OFFSET promptBad
        call WriteString
        jmp read
	goodInput:
       mov p1_color, eax
	   call Singleplayer_Game
	call press_esc_exit
	ret
singleplayer_menu ENDP

color_pallete PROC
	call ClrScr
	mov ecx, 255
	call WriteString
	call Crlf
	mov edx, offset texto_space
	colors:
		mov eax, ecx
		call SetTextColor
		call WriteDec
		mov eax, white+(black*16)
		call SetTextColor
		call WriteString
	loop colors
	call Crlf
	ret
color_pallete ENDP
