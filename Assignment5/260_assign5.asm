.386
.model flat,stdcall
.stack 4096
ExitProcess proto,dwExitCode:dword

.data
	var1 BYTE 'A'
	var2 BYTE 'B'
	var3 BYTE 'C'
	var4 BYTE 'D'
	
.code
main proc

mov al, var1
mov bl, var2
mov var2, al
mov al, var3
mov var3, bl
mov bl, var4
mov var4, al
mov var1, bl


;mov al, var1 ; comment 1: move var1 to register al
;mov bl, var2 ; comment 2: move var2 to register bl
;mov cl, var3 ; comment 3: move var3 to register cl
;mov dl, var4 ; comment 4: move var4 to register dl
;mov var1, dl ; comment 5: move dl to register var1
;mov var2, al ; comment 6: move al to register var2
;mov var3, bl ; comment 7: move bl to register var3
;mov var4, cl ; comment 8: move cl to register var4

mov al, var2
mov ah, var1
add eax, eax
add eax, eax
add eax, eax
add eax, eax
add eax, eax
add eax, eax
add eax, eax
add eax, eax
add eax, eax
add eax, eax
add eax, eax
add eax, eax
add eax, eax
add eax, eax
add eax, eax
add eax, eax
mov al, var4
mov ah, var3

mov bl, 0FFh
sub bl, var2
add bl, 1
mov bh, 0FFh
sub bh, var1
add bh, 1
add ebx, ebx
add ebx, ebx
add ebx, ebx
add ebx, ebx
add ebx, ebx
add ebx, ebx
add ebx, ebx
add ebx, ebx
add ebx, ebx
add ebx, ebx
add ebx, ebx
add ebx, ebx
add ebx, ebx
add ebx, ebx
add ebx, ebx
add ebx, ebx
mov bl, 0FFh
sub bl, var4
add bl, 1
mov bh, 0FFh
sub bh, var3
add bh, 1
	
	invoke ExitProcess,0
main endp
end main
