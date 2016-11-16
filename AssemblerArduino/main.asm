;
; AssemblerArduino.asm
;
; Created: 16/11/2016 12:01:16
; Author : danil
;


; Replace with your application code

	.ORG   0x0000

set_values: 
	LDI r16, 0b11111111
	OUT DDRB, r16

loop:
	SBI PortB, 5
	RCALL delay
	CBI PortB, 5
	RCALL delay
	RJMP loop

;; 16 Mhz Clock delay

delay:
;; set decimal value 200 to register 16
	LDI r16, 125

delay_1:
;; set decimal value 250 to register 15
	LDI r17, 250

delay_2:
;; set decimal value 125 to register 14
	LDI r26, 40

delay_3:
;; delay 4 * 4 clocks = 16
	DEC r26
	NOP
	BRNE delay_3

;; delay 16 * 4 * 250 clocks = 16000 (10ms) 
	DEC r17
	NOP
	BRNE delay_2

;; delay 16000 * 4 * 125 = 8000000 (500ms)
	DEC r16
	NOP
	BRNE delay_1
RET