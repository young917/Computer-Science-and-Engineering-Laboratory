TITLE Assignment 6 code : 20171697 ChoeMinYoung's code

INCLUDE irvine32.inc

.data
INCLUDE hw6_1.inc
rprompt BYTE "Copied string : ",0
.code
main PROC
	mov edx, OFFSET rprompt
	call WriteString
	mov eax, lengthof strSrc
	cmp eax, 40
	ja E1
	mov esi,0
	movzx ecx, copyNum
L1:
	mov al, strSrc[esi]
	mov strDest[esi],al
	inc esi
	loop L1
	mov strDest[esi],0
	mov edx,OFFSET strDest
	call WriteString
	call Crlf
E1:
	exit
main ENDP
END main