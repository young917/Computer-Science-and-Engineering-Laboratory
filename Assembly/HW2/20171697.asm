TITLE Assignment 2 code : 20171697 ChoeMinYoung's code

INCLUDE irvine32.inc

.data
INCLUDE hw2.inc

.code
main PROC								    ;EAX		EBX			val1
	mov EAX, val1						;1				0				1					
	add EAX, val1						;2				0				1
	mov EBX, val1						;2				1				1
	add EBX, EAX						    ;2				3				1
	add EBX, EAX						    ;2				5				1
	add EAX, EBX						    ;7				5				1
	add EBX, EAX						    ;7				12			1
	mov val1, EAX						;7				12			7
	add val1,EAX						    ;7				12			14
	mov EAX,EBX						    ;12			12			14
													;EBX			ECX			val2
	mov EBX, val2						;1				0				1
	add EBX, val2						    ;2				0				1
	mov ECX, val2						;2				1				1
	add ECX, EBX							;2				3				1
	add EBX, ECX						    ;5				3				1 
	add EBX, ECX						    ;8				3				1
	add EBX, ECX						    ;11			3				1
	add ECX, EBX						    ;11			14			1
	add EBX, ECX						    ;25			14			1
	sub ECX, val2							;25			13			1
	add EBX, ECX						    ;28			13			1
	add EBX, ECX						    ;51			13			1
	mov val2, ECX						;51			13			13
	mov ECX, val4						; ECX - val4	
	sub val3, ECX							; val3 = (val3-val4)
	mov val4, EBX						; val4 = 51*val2
													;EBX			ECX			val3
	mov EBX, val3						;1				0				1
	mov ECX, EBX						;1				1				1
	add EBX, val3							;2				1				1
	add ECX, EBX							;2				3				1			
	add EBX, ECX						    ;5				3				1
	add ECX, EBX						    ;5			    8				1
	add ECX, EBX							;5				13			1
	add ECX, val3							;5				14			1
	add val3, ECX							;5				14			15
	add EAX, val4						; EAX = 12*val1 + 51*val2
	add EAX, EBX						    ; EAX = 12*val1 + 51*val2 + 5*(val3-val4)
	mov EBX, val1					    ; EBX = 14*val1
	add EBX, val2						    ; EBX = 14*val1 + 13*val2
	sub EBX, val3							; EBX = 14*val1 + 13*val2 - 15*(val3-val4)
	call DumpRegs
	exit
main ENDP
END main