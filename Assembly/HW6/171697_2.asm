TITLE Assignment 6 code : 20171697 ChoeMinYoung's code

INCLUDE irvine32.inc

.data
INCLUDE hw6_2.inc
rprompt BYTE "Position value : ",0
.code
main PROC
	mov edx, OFFSET rprompt
	call Writestring
	mov eax, lengthof source
	mov ecx, lengthof target
	cmp eax,ecx
	ja E2
	sub ecx, eax
	inc ecx
	mov edi, 0
L1:
	mov al, target[edi]
	cmp al, source
	jne N2
	mov esi,1
	push ecx
	mov ecx, lengthof source
	sub ecx,2
L2:
	mov al, target[edi+esi]
	cmp al, source[esi]
	jne N1
	inc esi
	Loop L2
	mov pos, edi
	Jmp E1
N1:
	pop ecx
N2:
	inc edi
	Loop L1
	Jmp E2
E1:
	mov eax, pos
	call WriteDec
E2:
	call crlf
	exit
main ENDP
END main