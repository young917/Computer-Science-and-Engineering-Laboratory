TITLE Assignment 5 code : 20171697 ChoeMinYoung's code

INCLUDE irvine32.inc


.data
INCLUDE hw5_2.inc
BPrompt BYTE "Before sort : ",0
APrompt BYTE "After sort : ",0
Presentation BYTE ", ",0

.code
main PROC
	mov edx,OFFSET BPrompt
	call Display
	call BubbleSort_even
	call BubbleSort_odd
	mov edx, OFFSET APrompt
	call Display
	exit

main ENDP

;----------------------------------
Display PROC
; display prompt and pairs
; receives: edx, returns: nothing
;----------------------------------
	pushad
	call WriteString
	mov esi, 0
	mov ecx, LenData
L1:
	mov eax, ArrData[esi]
	call WriteHex
	mov edx, OFFSET Presentation
	cmp ecx,1
	JE I1
	call WriteString
	add esi,4
	Loop L1
I1:
	call Crlf
	popad
	ret
Display ENDP

;--------------------------------------
BubbleSort_even PROC
; descending order for X values
; ascending order for Y values
; in case of same X values 
; receives: nothing. returns: nothing
;--------------------------------------
	pushad
	mov ecx, LenData
	cmp ecx, 1
	JE E1
	Shr ecx, 1
	Sub ecx, 1
L1:
	push ecx
	mov esi, 4
L2:
	mov edx, 0
	mov eax, ArrData[esi]
	mov ebx, 10000h
	div ebx
	push edx
	push eax
	mov edx, 0
	mov eax, ArrData[esi+8]
	div ebx
	pop ebx					;ArrData[esi] x
	cmp ebx, eax			
	JA I3
	JB I2
	pop ebx					;ArrData[esi] y
	cmp ebx, edx	
	JB I4
	push ebx
I2:
	mov eax, ArrData[esi]
	mov ebx, ArrData[esi+8]
	mov ArrData[esi], ebx
	mov ArrData[esi+8],eax
I3:
	pop ebx
I4:
	add esi, 8
	Loop L2
	pop ecx
	Loop L1
E1:
	popad
	ret
BubbleSort_even ENDP

;--------------------------------------
BubbleSort_odd PROC
; ascending order for X values
; descending order for Y values
; in case of same X values 
; receives: nothing. returns: nothing
;--------------------------------------
	pushad
	mov ecx, LenData
	cmp ecx, 1
	JE E1
	SHR ecx, 1
	JC L1
	Sub ecx, 1
L1:
	push ecx
	mov esi, 0
L2:
	mov edx, 0
	mov eax, ArrData[esi]
	mov ebx, 10000h
	div ebx
	push edx
	push eax
	mov edx, 0
	mov eax, ArrData[esi+8]
	div ebx
	pop ebx
	cmp ebx, eax
	JB I3
	JA I2
	pop ebx
	cmp ebx, edx
	JA I4
	push ebx
I2:
	mov eax, ArrData[esi]
	mov ebx, ArrData[esi+8]
	mov ArrData[esi], ebx
	mov ArrData[esi+8],eax
I3:
	pop ebx
I4:
	add esi, 8
	Loop L2
	pop ecx
	Loop L1
E1:
	popad
	ret
BubbleSort_odd ENDP
END main