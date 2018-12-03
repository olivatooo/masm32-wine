;// Exerc�cio 01a T�pico 11
;//
;// Calcula e apresenta o n�mero de minutos em um dado per�odo de n dias.
;//
;//

INCLUDE libs/Irvine32.inc

nDays = 0FFFFFFFFh	

.data
	days DWORD ?
	minutesInDay DWORD ?
	totalMinutes DWORD ?
	str1 BYTE "Tempo (ms): ", 0

	startTime DWORD ?

.code

main PROC
	mov	days, 0
	mov	totalMinutes, 0
	call GetMseconds					;// get start time
	mov	startTime, eax
	mov eax, 24						;// minutesInDay = 24 * 60
	mov ebx, 60
	mul ebx
	mov minutesInDay, eax
	mov ecx, days
	mov edx, totalMinutes				;// totalMinutes += minutesInDay
L1:
	
	add edx, minutesInDay
	inc ecx							;// days++
	cmp ecx, ndays						;// if days <  nDays
	jb L1								;// repita o loop
	mov totalMinutes,edx
	mov edx, OFFSET str1
	call WriteString
	
	call GetMseconds					;// get stop time
	sub	eax, startTime
	call WriteDec						;// display elapsed time
	call Crlf
	call WaitMsg
	exit
main ENDP
END main
