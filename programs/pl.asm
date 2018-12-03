

; Description: MASM Assembly code that uses the Windows PlaySound function to play .wav files
; Revision date: Created Dec 3, 2013 by Michael Lindahl

includelib libs/winmm.lib
include libs/Irvine32.inc

PlaySound PROTO,
        pszSound:PTR BYTE, 
        hmod:DWORD, 
        fdwSound:DWORD

.data
deviceConnect BYTE "DeviceConnect",0
SND_ALIAS    DWORD 00010000h
SND_RESOURCE DWORD 00040005h
SND_FILENAME DWORD 00020000h

file BYTE "take.wav",0

.code
main PROC
     INVOKE PlaySound, OFFSET deviceConnect, NULL, SND_ALIAS
     INVOKE PlaySound, OFFSET file, NULL, SND_FILENAME
	exit
main ENDP
END main
