TITLE Assignment 3 code : 20171697 ChoeMinYoung's code

INCLUDE irvine32.inc

.data
var1 BYTE "65",0

.code
main PROC
	mov ecx, LENGTHOF var1
	sub ecx,2   ; store the length of var1 except 일의 자리수
	mov eax, 0  ; initialize eax
	mov esi, OFFSET var1  ; to access var1 from left to right 
L1:
	mov ebx, 0
	add bl, [esi]
	sub bl, "0"   ; store a single digit of var1 in ebx reg
	add eax, ebx  
	mov ebx, ecx ; store the value of ecx int ebx temporarily
	mov edx,eax ; edx stores the value of eax that doesn't passes loop
	mov ecx, 3 ; 
L2:
	add eax, eax
	loop L2  ; the result is eax = edx*8
	sub eax, edx ; we want eax*7 so perform eax-edx
	mov ecx,ebx ; ecx regain the value from ebx
	inc esi ; to perform the next single digit of var1
	loop L1  ; Incidently, if var1 is "abcd", I find answer by 7*(7*(7*(a)+b)+c)+d
	mov ebx, 0
	add bl, [esi]
	sub bl, "0"  ; var1의 일의 자리수 저장
	add eax, ebx ; var1의 일의 자리수를 더한다
	call DumpRegs
	exit
main ENDP
END main