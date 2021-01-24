.386
.model flat,stdcall
.stack 4096
ExitProcess proto,dwExitCode:dword


A_grade = 90 ;the minimum score to get an A (can be changed according to the grading scale used)
B_grade = 80 ;the minimum score to get a B (can be changed according to the grading scale used)
C_grade = 70 ;the minimum score to get a C (can be changed according to the grading scale used)
D_grade = 60 ;the minimum score to get a D (can be changed according to the grading scale used)

.data

letter_grade BYTE ? ; stores the letter grade ('A', 'B', 'C', 'D', or 'F')

.code


main proc

  mov eax, 80            ; comment 1: set up parameter eax
  call calculate_grade
  
  invoke ExitProcess, 0
main endp

; IMPLEMENT THE calculate_grade PROCEDURE
calculate_grade proc

cmp eax, A_grade         ; comment 2: parameter eax. In this function the eax needs to be given.
jae A                    ; comment 3: jump to label A if eax is above or equal to A_grade

cmp eax, B_grade         ; comment 4: for B_grade check and jump
jae B

cmp eax, C_grade         ; comment 5: for C_grade check and jump
jae C_label

cmp eax, D_grade         ; comment 6: for D_grade check and jump
jae D

jmp F                    ; comment 7: else jump to F label


A:
  mov letter_grade, 'A'  ; comment 8: A label
  jmp done


B:
  mov letter_grade, 'B'  ; comment 9: B label
  jmp done


C_label:
  mov letter_grade, 'C'  ; comment 10: C label
  jmp done


D:
  mov letter_grade, 'D'  ; comment 11: D label
  jmp done

F:
  mov letter_grade, 'F'  ; comment 12: F label
  jmp done


done:                    ; comment 13: done label
  ret
  calculate_grade endp
  
end main
