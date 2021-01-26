; AddTwo.asm - adds two 32-bit integers.
; Chapter 3 example

.386
.model flat,stdcall
.stack 4096
ExitProcess proto,dwExitCode:dword

.data

player1 BYTE 'P' ; this can be 'r', 'p', 's', 'R', 'P', or 'S'
player2 BYTE 'S' ; this can be 'r', 'p', 's', 'R', 'P', or 'S'
outcome BYTE ?    ; this will be 1, 2, or 3 at the end


.code
main proc

call to_upper
call RPS

 invoke ExitProcess,0
main endp

; IMPLEMENT THE TO_UPPER AND RPS PROCEDURES
to_upper proc

cmp player1, 97       ; comment 1: if player1 is lowercase, jump to player1_label
jae player1_label

cmp player2, 97       ; comment 2: if player2 is lowercase, jump to player1_label
jae player2_label

jmp done

player1_label:
    mov al, player1
    sub al, 32
    mov player1, al

    cmp player2, 97
    jae player2_label

    jmp done

player2_label:
    mov al, player2
    sub al, 32
    mov player2, al
    jmp done

done:
    ret
    to_upper endp



RPS proc

mov bl, player2
cmp player1, bl
je tie

cmp player1, 'R' 
je R_condition

cmp player1, 'P'
je P_condition 

cmp player1, 'S'
je S_condition


R_condition:
cmp player2, 'R'  ; comment 3: player1(R): 82  
jb player_2_won   ; comment 4: player2(P) < 82  R(82) P(80) P win 
ja player_1_won   ; comment 5: player2(S) > 82  R(82) S(83) R win

P_condition:      ; comment 6: player1 is R, get the winner if player2 is R or S
cmp player2, 'R'
je player_1_won
cmp player2, 'S'
je player_2_won

S_condition:      ; comment 7: player1 is S, get the winner if player2 is R or S
cmp player2, 81
jb player_1_won
ja player_2_won


tie:              ; comment 8: tie condition
mov outcome, 3    
jmp done

player_1_won:     ; comment 9: when player1 wins, put 1 into outcome
mov outcome, 1
jmp done

player_2_won:     ; comment 10: when player2 wins, put 1 into outcome
mov outcome, 2
jmp done

done:
    ret
    RPS endp

end main