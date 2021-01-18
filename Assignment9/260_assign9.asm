; Program template

.386
.model flat,stdcall
.stack 4096
ExitProcess proto,dwExitCode:dword

DAYS = 7     ; constant representing the number of days in a week
HOURS = 24   ; constant representing the number of hours in a day
MINUTES = 60  ; constant representing the number of minutes in an hour
SECONDS = 60  ; constant representing the number of seconds in a minute

.data

date_time DWORD ? ; byte 0000 stores the DAY, byte 0001 stores the HOUR, byte 0002 stores the MINUTE, and byte 0003 stores the SECOND
num_of_iters DWORD 0  ; counts the total number of iterations
day BYTE DAYS   ; used to restore cl to the current day value
hour BYTE HOURS  ; used to restore cl to the current hour value
minute BYTE MINUTES  ; used to restore cl to the current minute value
	
.code
main proc

mov eax, 0                              ; comment 1: count variable in the c++ code
                                        ;            num_of_iters in this assignment
                     
                     
mov ecx, DAYS                           ; comment 2: set outer loop(dayLoop) counter
dayLoop:                     
	mov day, cl                         ; comment 3: save outer loop(dayLoop) counter
	mov ebx, DAYS                       ; comment 4: set up the first memory address' value as DAYS
	sub bl, cl                          ; comment 5: compute ascending counter from the descending ecx counter. for example, it should be the 7-7, 7-6, 7-5, 7-4...   
	mov BYTE PTR [date_time + 0], bl    ; comment 6: store the value to the first memory address of data_time

	; comment 7: nested hourLoop
	mov ecx, HOURS
	hourLoop:
		mov hour, cl
		mov ebx, HOURS
		sub bl, cl
		mov BYTE PTR [date_time + 1], bl

		; comment 8: nested minuteLoop
		mov ecx, MINUTES
		minuteLoop:
			mov minute, cl
			mov ebx, MINUTES
			sub bl, cl
			mov BYTE PTR [date_time + 2], bl

			; comment 9: nested secondsLoop
			mov ecx, SECONDS  
			secondsLoop:
				mov ebx, SECONDS
				sub bl, cl
				mov BYTE PTR [date_time + 3], bl
				add eax, 1
				loop secondsLoop

		mov cl, minute                  ; comment 10: restore outer loop(minuteLoop) counter
		loop minuteLoop

	mov cl, hour                        ; comment 11: restore outer loop(hourLoop) counter
	loop hourLoop

mov cl, day                             ; comment 12: restore outer loop(dayLoop) counter
loop dayLoop

mov num_of_iters, eax

	invoke ExitProcess,0
main endp
end main
