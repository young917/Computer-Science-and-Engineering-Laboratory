TITLE Assignment 4 code : 20171697 ChoeMinYoung's code

INCLUDE irvine32.inc

BUFMAX = 40
KEYMAX = 10

.data
enter_text_Prompt BYTE "Enter a plain text : ",0
enter_key_Prompt BYTE "Enter a key : ",0
oPrompt BYTE "Original Text : ", 0
ePrompt BYTE "Encrypted Text : ", 0
dPrompt BYTE "Decrypted Text : ", 0
ending_Prompt BYTE "Bye!", 0

buffer_string BYTE BUFMAX+1 DUP(0)
bufSize DWORD ?
buffer_key BYTE KEYMAX+1 DUP(0)
keySize DWORD ?

.code
main PROC
L1:
	call InputData
	cmp eax,0
	JE NEXT
	mov edx, OFFSET oPrompt
	call DisplayMessage
	call TranslateBuffer
	mov edx, OFFSET ePrompt
	call DisplayMessage
	call TranslateBuffer
	mov edx, OFFSET dPrompt
	call DisplayMessage
	call Crlf
	call Crlf
	JMP L1
NEXT:
	mov edx, OFFSET ending_Prompt
	call WriteString
	call Crlf
	exit
main ENDP

;----------------------------------------------
InputData PROC
; Asks the user to enter a string and a key.
; Saves the string and its length,
; the key and its length
; If the length of string or key
; exceeds the range, ask again
; Receives: nothing. Returns: EAX
;----------------------------------------------
	mov edx, OFFSET enter_text_Prompt
	call WriteString
	mov ecx, BUFMAX+1
	mov edx, OFFSET buffer_string
	call ReadString
	JZ Ending
	mov bufSize, eax
	mov edx, OFFSET enter_key_Prompt
	call WriteString
	mov ecx, KEYMAX+1
	mov edx, OFFSET buffer_key
	call ReadString
	mov KeySize, eax
	call Crlf
	call Crlf
Ending:
	ret
InputData ENDP

;-------------------------------------------------
TranslateBuffer PROC
; Translates the string by WORing each byte
; with received key
; Receives: nothing. Returns: nothing
;------------------------------------------------
	pushad
	mov ecx, bufSize
	mov esi, 0
	mov ebx, 0
L1:
	cmp ebx, KeySize
	JB NEXT
	sub ebx, KeySize
NEXT:
	mov al, buffer_key[ebx]
	XOR buffer_string[esi] , al
	inc esi
	inc ebx
	loop L1

	popad
	ret
TranslateBuffer ENDP

;-------------------------------------------------
DisplayMessage PROC
; Display input or encrypted or decrypted message.
; Receives: EDX points to the prompt
; Returns: nothing
;-------------------------------------------------
	pushad
	call WriteString
	mov esi, 0
	mov ecx, bufSize
L1:
	mov al, buffer_string[esi]
	call WriteChar
	inc esi
	loop L1

	call Crlf
	popad
	ret
DisplayMessage ENDP
END main