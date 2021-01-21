; Program template

.386
.model flat,stdcall
.stack 4096
ExitProcess proto,dwExitCode:dword

ROWS = 5      ; this can be changed to any value between 2 - 16; the correct V pattern should be "drawn" in memory in all cases
COLS = 2*ROWS-1
MID_COL = COLS/2   ; 4 

.data
V BYTE 32*ROWS dup (?) ; the memory allocated for the V pattern
curr_row BYTE ? ; this refers to the current row in the pattern being processed

; count is used to refer to a row in memory, such as 0x00404000 (row 0), 0x00404020 (row 32), 0x00404040 (row 64), etc
; You need to use count to move between the different rows in memory
; HINT: think about incrementing or decrementing count by 32

count DWORD 0 ; 32*(ROWS-1) ; you can change the initial value depending on if you want it to count up or down

.code
main proc

call draw_v_pattern

	invoke ExitProcess,0
main endp


draw_v_pattern proc

mov eax, 0
mov curr_row, al                 ; comment 1: initialize the curr_row

; start the loop

mov ecx, ROWS - 1
vPatternOuter:
	push ecx                     ; mov curr_row, cl  
	mov edx, OFFSET V            ; comment 2: keep updating the pointer: V + count 
	add edx, count
	
	mov cl, curr_row             ; comment 3: the vPatternSpace loop counter should set up first before jump. 
	inc cl                       ;            curr_row is 0 base, so we don't need curr_row - 1

	jmp L1

	vPatternSpace:
		mov ebx, " "
		mov [edx + 0], bl        ; comment 4: store the " "(space) to the first memory location
		inc edx                  ; comment 5: pointer for the next charactor

	L1:
	loop vPatternSpace



	mov ebx, "*"
	mov [edx + 0], bl
	inc edx

	mov ecx, COLS                ; comment 6: COLS - curr_row - 1 - (curr_row + 1) = COLS - 2 * curr_row - 2
	sub cl, curr_row
	sub cl, curr_row    
	sub ecx, 2
	vPatternSpace2:
		mov ebx, " "
		mov [edx + 0], bl
		inc edx
	loop vPatternSpace2

	mov ebx, "*"
	mov [edx + 0], bl
	inc edx 

	add curr_row, 1
	add count, 32                ; comment 7: "\n"
	
pop ecx  ;mov cl, curr_row
loop vPatternOuter

 
mov edx, OFFSET V                ; comment 8: V + count
add edx, count
mov ecx, MID_COL     
vPatternMid:
	push ecx

	mov ebx, " "
	mov [edx + 0], bl
	inc edx

pop ecx 
loop vPatternMid                 

mov ebx, "*"
mov [edx + 0], bl
inc edx

ret
draw_v_pattern endp              ; comment 9: draw_v_pattern loop ends  

end main                         ; comment 10: program ends
