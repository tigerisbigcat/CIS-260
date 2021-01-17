.386
.model flat,stdcall
.stack 4096
ExitProcess proto,dwExitCode:dword


; change NUM to the value that you want to run the program with 
NUM = 10 
.data

; do NOT change quadArray here in the data segment!!!
; You will be building this array with your loop

quadArray DWORD NUM DUP(0)

.code
main proc
	
	; initialize esi
mov esi, OFFSET quadArray
mov ecx, NUM - 4   ; comment 1: set up the loop counter 

;mov ecx, [esi]
mov al, 1          ; comment 2: set al to 1
mov [esi], al      ; comment 3: set base 1 equal to 1
mov [esi + 4], al  ; comment 4: set base 2 equal to 1
mov [esi + 8], al  ; comment 5: set base 3 equal to 1
mov [esi + 12], al ; comment 6: set base 4 equal to 1
add esi, 16        ; comment 7: move the location to the fiith element.


; comment 8: use the loop to get the element which is 5th, 6th..etc.
L1:
mov eax, 0
add eax, [esi - 1*4]  
add eax, [esi - 2*4]
add eax, [esi - 3*4]
add eax, [esi - 4*4]

mov [esi], eax  ; comment 9: write the value to the nth of esi.
add esi, 4      ; comment 10: move to the next element

loop L1


	invoke	ExitProcess,0
main endp
end main