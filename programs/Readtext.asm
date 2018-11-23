.386
.model flat, stdcall
option casemap :none

include libs/windows.inc
include libs/user32.inc
include libs/kernel32.inc

includelib libs/user32.lib
includelib libs/kernel32.lib

.data
FileName      db "teste.ro", 0
ErrorCaption  db "Error!" ,0
ErrorMsg	  db "Cannot open file" ,0
.data?
hFile HANDLE ?
hMemory HANDLE ?
pMemory DWORD ?
ReadSize DWORD ?

.const
MEMORYSIZE equ 65535

.code

start:

invoke CreateFile, addr FileName, GENERIC_READ, FILE_SHARE_READ,
NULL, OPEN_EXISTING, FILE_ATTRIBUTE_NORMAL, NULL
.if eax!=INVALID_HANDLE_VALUE		;if file exists ... then
mov hFile, eax

invoke GlobalAlloc, GMEM_MOVEABLE or GMEM_ZEROINIT, MEMORYSIZE
mov hMemory, eax
invoke GlobalLock, hMemory
mov pMemory, eax

invoke ReadFile, hFile, pMemory, MEMORYSIZE-1, addr ReadSize, NULL
invoke MessageBox, NULL, pMemory, addr FileName, MB_OK

invoke GlobalUnlock, pMemory
invoke GlobalFree, hMemory
invoke CloseHandle, hFile
.else  ;if file does not texists ... than invoke the "Error" message box instead!
				invoke MessageBox,NULL,addr ErrorMsg, addr ErrorCaption,MB_OK
				
.endif

invoke ExitProcess, NULL

end start
