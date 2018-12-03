ReadfileNow proc
	mov edx,offset msg
	Call Writestring
	mov edx,OFFSET filename
	mov ecx,SIZEOF filename
	call ReadString
                                           
	mov edx,OFFSET filename
	call OpenInputFile
	mov fileHandle,eax
                                            
	cmp eax,INVALID_HANDLE_VALUE                
	jne file_ok                                  
	jmp quit                                     
	file_ok:                                      
		mov edx,OFFSET buffer
		mov ecx,BUFFER_SIZE
		call ReadFromFile
		jnc check_buffer_size                       
		call WriteWindowsMsg
		jmp close_file

	check_buffer_size:
		cmp eax,BUFFER_SIZE                          

	jb buf_size_ok
	jmp quit                                     

	buf_size_ok:
		mov buffer[eax],0                            
		call WriteDec                                
		call Crlf

	mov esi,OFFSET buffer             
	mov ecx,10
	mov edx,offset arr

	L3:
		mov al,[esi]
		call dumpregs
		mov [edx],al
		mov al,0
		mov al,[edx]
		Call WriteInt
		mov al,09h
		Call WriteChar

		add esi,2
		add edx,2
	loop L3
	ret
	        
	call WriteString
	call Crlf

	close_file:
		mov eax,fileHandle
		call CloseFile

	quit:
		exit
ReadfileNow ENDP