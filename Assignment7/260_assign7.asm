.386
.model flat,stdcall
.stack 4096
ExitProcess proto,dwExitCode:dword

.data
   array1 DWORD 1, 2, 3, 4, 5
   array2 DWORD 6, 7, 8, 9, 10
   array3 DWORD LENGTHOF array1 dup(?)

.code
main proc

; comment 1: exchange array1[0] and array2[4]
mov eax, array2 + 16
mov edx, array1
mov array1, eax
mov array2 + 16, edx

; comment 2: exchange array1[1] and array2[3]
mov eax, array2 + 12
mov edx, array1 + 4
mov array1 + 4, eax
mov array2 + 12, edx

; comment 3: exchange array1[2] and array2[2]
mov eax, array2 + 8
mov edx, array1 + 8
mov array1 + 8, eax
mov array2 + 8, edx

; comment 5: exchange array1[3] and array2[1]
mov eax, array2 + 4
mov edx, array1 + 12
mov array1 + 12, eax
mov array2 + 4, edx

; comment 6: exchange array1[4] and array2[0]
mov eax, array2
mov edx, array1 + 16
mov array1 + 16, eax
mov array2, edx


; comment 7: sub array1[0] and array2[0], save the result to array3[0]
mov eax, array1
sub eax, array2
mov array3, eax

; comment 8: sub array1[1] and array2[1], save the result to array3[1]
mov eax, array1 + 4
sub eax, array2 + 4
mov array3 + 4, eax

; comment 9: sub array1[2] and array2[2], save the result to array3[2]
mov eax, array1 + 8
sub eax, array2 + 8
mov array3 + 8, eax

; comment 10: sub array1[3] and array2[3], save the result to array3[3]
mov eax, array1 + 12
sub eax, array2 + 12
mov array3 + 12, eax

; comment 11: sub array1[4] and array2[4], save the result to array3[4]
mov eax, array1 + 16
sub eax, array2 + 16
mov array3 + 16, eax


	invoke ExitProcess,0
main endp
end main