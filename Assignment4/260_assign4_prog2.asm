
; Program template

.386
.model flat,stdcall
.stack 4096
ExitProcess proto,dwExitCode:dword

.data

A DWORD ?
B DWORD 1
C1 DWORD 2  ; C is a reserved word
D DWORD 3
E DWORD 4
F DWORD 5
G DWORD 6
H DWORD 7
I DWORD 8
J DWORD 9
K DWORD 10
L DWORD 11
M DWORD 12
N DWORD 13
O DWORD 14
P DWORD 15

.code
main proc
	
mov eax, 0  ; initialize eax to 0
add eax, E  ; instruction 1
add eax, E  ; instruction 2
add eax, E  ; instruction 3

mov ebx, eax  ; ebx=12
add eax, ebx  ; instruction 4
add eax, ebx  ; instruction 5
add eax, ebx  ; instruction 6
add eax, ebx  ; instruction 7

mov ebx, eax  ; ebx=60
add eax, ebx  ; instruction 8
add eax, ebx  ; instruction 9
add eax, ebx  ; instruction 10
add eax, ebx  ; instruction 11
add eax, ebx  ; instruction 12

mov ebx, eax  ; ebx=360
add eax, ebx  ; instruction 13
add eax, ebx  ; instruction 14
add eax, ebx  ; instruction 15
add eax, ebx  ; instruction 16
add eax, ebx  ; instruction 17
add eax, ebx  ; instruction 18

mov ebx, eax  ; ebx=2520
add eax, ebx  ; instruction 19
add eax, ebx  ; instruction 20
add eax, ebx  ; instruction 21
add eax, ebx  ; instruction 22
add eax, ebx  ; instruction 23
add eax, ebx  ; instruction 24
add eax, ebx  ; instruction 25

mov ebx, eax  ; ebx=20,160
add eax, ebx  ; instruction 26
add eax, ebx  ; instruction 27
add eax, ebx  ; instruction 28
add eax, ebx  ; instruction 29
add eax, ebx  ; instruction 30
add eax, ebx  ; instruction 31
add eax, ebx  ; instruction 32
add eax, ebx  ; instruction 33

mov ebx, eax  ; ebx=181,440
add eax, ebx  ; instruction 34
add eax, ebx  ; instruction 35
add eax, ebx  ; instruction 36
add eax, ebx  ; instruction 37
add eax, ebx  ; instruction 38
add eax, ebx  ; instruction 39
add eax, ebx  ; instruction 40
add eax, ebx  ; instruction 41
add eax, ebx  ; instruction 42

mov ebx, eax  ; ebx=1,814,400
add eax, ebx  ; instruction 43
add eax, ebx  ; instruction 44
add eax, ebx  ; instruction 45
add eax, ebx  ; instruction 46
add eax, ebx  ; instruction 47
add eax, ebx  ; instruction 48
add eax, ebx  ; instruction 49
add eax, ebx  ; instruction 50
add eax, ebx  ; instruction 51
add eax, ebx  ; instruction 52

add eax, B  ; instruction 53
add eax, C1 ; instruction 54
add eax, M  ; instruction 55
add eax, N  ; instruction 56
add eax, O  ; instruction 57
add eax, P  ; instruction 58

mov A, eax

	invoke ExitProcess,0
main endp
end main