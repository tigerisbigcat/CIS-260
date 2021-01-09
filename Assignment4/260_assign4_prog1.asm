; Program template

.386
.model flat,stdcall
.stack 4096
ExitProcess proto,dwExitCode:dword

.data
	A DWORD ?
	B DWORD 5
	C1 DWORD 10
	D DWORD 4
	E DWORD 6
	F DWORD 7
	G DWORD 8
	H DWORD 2
	I DWORD 3
	J DWORD 12


.code
main proc

mov eax, 0  ; instruction 1
add eax, B  ; instruction 2
add eax, C1 ; instruction 3
add eax, B  ; instruction 4
add eax, B  ; instruction 5
add eax, B  ; instruction 6
add eax, B  ; instruction 7
add eax, E  ; instruction 8
add eax, E  ; instruction 9
add eax, E  ; instruction 10
add eax, E  ; instruction 11
add eax, E  ; instruction 12
add eax, F  ; instruction 13
add eax, F  ; instruction 14
add eax, F  ; instruction 15
add eax, F  ; instruction 16
add eax, F  ; instruction 17
add eax, F  ; instruction 18
add eax, G  ; instruction 19
add eax, G  ; instruction 20
add eax, G  ; instruction 21
add eax, G  ; instruction 22
add eax, G  ; instruction 23
add eax, G  ; instruction 24
add eax, G  ; instruction 25
add eax, D  ; instruction 26
add eax, D  ; instruction 27
add eax, D  ; instruction 28
add eax, D  ; instruction 29
add eax, B  ; instruction 30
add eax, B  ; instruction 31
add eax, B  ; instruction 32
add eax, B  ; instruction 33
add eax, B  ; instruction 34
add eax, I  ; instruction 35
add eax, I  ; instruction 36
add eax, D  ; instruction 37
add eax, D  ; instruction 38
add eax, D  ; instruction 39
add eax, H  ; instruction 40
add eax, J  ; instruction 41

mov A, eax


	invoke ExitProcess,0
main endp
end main