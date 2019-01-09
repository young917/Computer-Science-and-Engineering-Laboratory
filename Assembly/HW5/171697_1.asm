TITLE Assignment 5 code : 20171697 ChoeMinYoung's code

INCLUDE irvine32.inc

.data
INCLUDE hw5_1.inc
OPrompt BYTE "Original Text : ",0
EPrompt BYTE "Encrypted Text : ",0
DPrompt BYTE "Decrypted Text : ",0
.code
main PROC

	mov edx, OFFSET OPrompt
	call DisplayMessage
	call Encrypt
	mov edx, OFFSET EPrompt
	call DisplayMessage
	call Dcrypt
	mov edx, OFFSET DPrompt
	call DisplayMessage

	exit
main ENDP

;-----------------------------------------------------
DisplayMessage PROC
; display original or encrypted or decrypted message.
; receives: EDX points to the message
; returns: nothing
;-----------------------------------------------------
	pushad
	call WriteString
	mov esi, 0
	mov ecx, LENGTHOF PlainText
L1:	
	mov al, PlainText[esi]
	call WriteChar
	inc esi
	Loop L1
	call Crlf
	popad
	ret
DisplayMessage ENDP

;-------------------------------------------------------
Encrypt PROC
; rotate each character of the plain text with key
; if key is positive, rotate right
; if key is negative, rotate left
; receives : nothing. returns: nothing
;-------------------------------------------------------
	mov esi, 0
	mov ebx, LENGTHOF KeyRotate
	mov ecx, LENGTHOF PlainText
	mov edx, 0
L1: 
	cmp edx, ebx
	JB I1
	mov edx,0
I1:	
	push ecx
	cmp KeyRotate[edx],0
	JL I2  ; minus인 경우
	movzx ecx, KeyRotate[edx]
	JZ I3
L2:
	ROR PlainText[esi],1
	Loop L2
	JMP I3
I2:
	movsx ecx, KeyRotate[edx]
	neg ecx
L3:
	ROL PlainText[esi],1
	Loop L3
I3:
	pop ecx
	inc esi
	inc edx
	Loop L1
	ret
Encrypt ENDP

;---------------------------------------------------
Dcrypt PROC
; rotate each character of the plain text with key
; if key is positive, rotate left
; if key is negative, rotate right
; receives : nothing. returns: nothing
;--------------------------------------------------
	mov esi, 0
	mov ebx, LENGTHOF KeyRotate
	mov ecx, LENGTHOF PlainText
	mov edx, 0
L1: 
	cmp edx, ebx
	JB I1
	mov edx,0
I1:	
	push ecx
	cmp KeyRotate[edx],0
	JL I2  ; minus인 경우
	movzx ecx, KeyRotate[edx]
	JZ I3
L2:
	ROL PlainText[esi],1
	Loop L2
	JMP I3
I2:
	movsx ecx, KeyRotate[edx]
	neg ecx
L3:
	ROR PlainText[esi],1
	Loop L3
I3:
	pop ecx
	inc esi
	inc edx
	Loop L1
	ret
Dcrypt ENDP
END main