TITLE Assignment 4 code : 20171697 ChoeMinYoung's code

INCLUDE irvine32.inc

BUFMAX = 40

.data
sPrompt BYTE "Type_A_String_To_Reverse: ",0
ePrompt BYTE "Reversed_String: ",0
fPrompt BYTE "Bye!",0

buffer BYTE BUFMAX+2 DUP(0)
bufSize DWORD ?

.code
main PROC
L1:
	call Input_String
	cmp bufSize, 0
	JE NEXT
	call Reverse_String
	call Display_result
	JMP L1

NEXT:
	mov edx, OFFSET fPrompt
	call WriteString
	call Crlf

	exit
main ENDP

;----------------------------------------
Input_String PROC
; Asks the user to enter a string.
; Saves the string and its length
; if length is larger than BUFMAX
; get input again
; Receives: nothing. Returns: nothing.
;----------------------------------------
	pushad

L1:
	mov edx, OFFSET sPrompt
	call WriteString
	mov ecx, BUFMAX+2
	mov edx, OFFSET buffer
	call ReadString
	cmp eax, BUFMAX
	JA L1
	mov bufSize, eax
	popad
	ret

Input_String ENDP

;----------------------------------------
Reverse_String PROC
; uppercase is changed to lowercase
; lowercase is changed to uppercase
; reverse string
; Receives: nothing. Returns: nothing.
;----------------------------------------
	pushad
	mov ecx, bufSize
	mov esi, 0
L1:
	mov bl, buffer[esi]
	cmp bl, 41h
	JB R1
	cmp bl, 5Ah
	JBE M1
	cmp bl, 61h
	JB R1
	cmp bl, 7Ah
	JA R1
	AND bl, 11011111b
	JMP R1
M1:
	OR bl, 00100000b
R1:	
	movzx eax, bl
	push eax
	inc esi
	Loop L1

	mov ecx, bufSize
	mov esi, 0
L2: pop eax
	mov buffer[esi], al
	inc esi
	Loop L2

	popad
	ret
Reverse_String ENDP

;---------------------------------------
Display_result PROC
;
; Display reversed String
; Receives: nothing. Returns: nothing
;---------------------------------------
	pushad
	mov edx, OFFSET ePrompt
	call WriteString
	mov edx, OFFSET buffer
	call WriteString
	call Crlf
	popad
	ret
Display_result ENDP
END main