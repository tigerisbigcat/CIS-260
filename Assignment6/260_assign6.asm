; Program template

.386
.model flat,stdcall
.stack 4096
ExitProcess proto,dwExitCode:dword

.data

   msgforward WORD 6 DUP(?)
   msgbackward WORD 6 DUP(?)
   restore_esp DWORD ?

.code
main proc
  
  mov restore_esp, esp ; save the contents of register ESP so it can be restored before the program finishes
                       ; DO NOT REMOVE THIS

  ; clear the registers

  mov eax, 0
  mov ebx, 0
  mov ecx, 0
  mov edx, 0
  mov esi, 0
  mov edi, 0
  mov esp, 0
  mov ebp , 0

     ; store the message "Welcome Home" in reverse order across the six 16-bit registers

   mov ax, "XW"
   mov bx, "VU"
   mov si, "TS"
   mov di, "RQ"
   mov sp, "PO"
   mov bp, "NM"

   mov [msgforward+0], bp ; comment 1: get the value from bp, put the value into the first element of the array of msgforward.
   mov [msgforward+2], sp ; comment 2: get the value from sp, put the value into the second element of the array of msgforward.
   mov [msgforward+4], di ; comment 3: get the value from di, put the value into the third element of the array of msgforward.
   mov [msgforward+6], si ; comment 4: get the value from si, put the value into the forth element of the array of msgforward.
   mov [msgforward+8], bx ; comment 5: get the value from bx, put the value into the fifth element of the array of msgforward.
   mov [msgforward+10], ax ; comment 6: get the value from ax, put the value into the sixth element of the array of msgforward.
   

   mov cx, bp
   mov dl, ch ; comment 7: dl will be "E"
   mov dh, cl ; comment 8: dh will be "W"
   mov bp, dx ; comment 9: for dx, it should be dh,dl. so dh is w, dl is E, then dx will present "WE"

   ; comment 10: swap two characts in the sp
   mov cx, sp
   mov dl, ch
   mov dh, cl
   mov sp, dx

   ; comment 11: swap two characts in the di
   mov cx, di
   mov dl, ch
   mov dh, cl
   mov di, dx

   mov cx, si
   mov dl, ch
   mov dh, cl
   mov si, dx

   ; comment 12: swap two characts in the bx
   mov cx, bx
   mov dl, ch
   mov dh, cl
   mov bx, dx

   ; comment 13: swap two characts in the ax
   mov ch, al
   mov cl, ah
   mov ax, cx

;   ; comment 13: swap two characts in the ax
;   mov cx, ax
;   mov dl, ch
;   mov dh, cl
;   mov ax, dx

   ; comment 14: put the value into array of msgbackward.
   mov [msgbackward+0], ax 
   mov [msgbackward+2], bx 
   mov [msgbackward+4], si 
   mov [msgbackward+6], di 
   mov [msgbackward+8], sp 
   mov [msgbackward+10], bp 


mov esp, restore_esp       ; restore register ESP to it's original value so the program can end correctly
                           ; DO NOT REMOVE THIS

	invoke ExitProcess,0
main endp
end main
