;
; AssemblerArduino.asm
;
; Created: 16/11/2016 12:01:16
; Author : danil
;

;;CLOCK Table
;;LDI = 1
;;SBI = 2
;;RCALL = 3
;;OUT = 1
;;RJMP = 2

	.ORG   0x0000

set_values: 
	;;LDI r27, 0b11111111
	;;OUT DDRD, r27

	;;Seta os bits 1-7 da porta D como saída
	SBI PortD, 1
	SBI PortD, 2
	SBI PortD, 3
	SBI PortD, 4
	SBI PortD, 5
	SBI PortD, 6
	SBI PortD, 7
	;;Seta os bits 0-5 da porta B como saída
	SBI PortB, 0
	SBI PortB, 1
	SBI PortB, 2
	SBI PortB, 3
	SBI PortB, 4
	;;Seta os bits 0-1 da porta C como saída
	SBI PortC, 0
	SBI PortC, 1


loop:
	RCALL display1

display1:
	;;ZERO
	LDI r26, 0b00011111
	LDI r27, 0b00000001
	OUT DDRB, r26
	OUT DDRC, r27
	RCALL display0
	;;UM
	LDI r26, 0b00000110
	LDI r27, 0b00000000
	OUT DDRB, r26
	OUT DDRC, r27
	RCALL display0
	;;DOIS
	LDI r26, 0b00011011
	LDI r27, 0b00000010
	OUT DDRB, r26
	OUT DDRC, r27
	RCALL display0
	;;TRÊS
	LDI r26, 0b00001111
	LDI r27, 0b00000010
	OUT DDRB, r26
	OUT DDRC, r27
	RCALL display0
	;;QUATRO
	LDI r26, 0b00000110
	LDI r27, 0b00000011
	OUT DDRB, r26
	OUT DDRC, r27
	RCALL display0
	;;CINCO
	LDI r26, 0b00001101
	LDI r27, 0b00000011
	OUT DDRB, r26
	OUT DDRC, r27
	RCALL display0
	;;SEIS
	LDI r26, 0b00011101
	LDI r27, 0b00000011
	OUT DDRB, r26
	OUT DDRC, r27
	RCALL display0
	;;SETE
	LDI r26, 0b00000111
	LDI r27, 0b00000000
	OUT DDRB, r26
	OUT DDRC, r27
	RCALL display0
	;;OITO
	LDI r26, 0b00011111
	LDI r27, 0b00000011
	OUT DDRB, r26
	OUT DDRC, r27
	RCALL display0
	;;NOVE
	LDI r26, 0b00001111
	LDI r27, 0b00000011
	OUT DDRB, r26
	OUT DDRC, r27
	RCALL display0
	RJMP loop

display0:
	;;ZERO
	LDI r27, 0b01111110
	OUT DDRD, r27
	RCALL delay
	;;UM
	LDI r27, 0b00001100
	OUT DDRD, r27
	RCALL delay
	;;DOIS
	LDI r27, 0b10110110
	OUT DDRD, r27
	RCALL delay
	;;TRÊS
	LDI r27, 0b10011110
	OUT DDRD, r27
	RCALL delay
	;;QUATRO
	LDI r27, 0b11001100
	OUT DDRD, r27
	RCALL delay
	;;CINCO
	LDI r27, 0b11011010
	OUT DDRD, r27
	RCALL delay
	;;SEIS
	LDI r27, 0b11111010
	OUT DDRD, r27
	RCALL delay
	;;SETE
	LDI r27, 0b00001110
	OUT DDRD, r27
	RCALL delay
	;;OITO
	LDI r27, 0b11111110
	OUT DDRD, r27
	RCALL delay
	;;NOVE
	LDI r27, 0b11011110
	OUT DDRD, r27
	RCALL delay
RET

;; 20 Mhz Clock delay

delay:
;; set decimal value 200 to register 16
	LDI r16, 80

delay_1:
;; set decimal value 250 to register 15
	LDI r17, 250

delay_2:
;; set decimal value 40 to register 14
	LDI r26, 200

delay_3:
;; delay 200 * 4 = 1000 clocks
	DEC r26       ;; 1 clock
	NOP           ;; 1 clock
	BRNE delay_3  ;; 2 clocks on jump, 1 when continue

;; delay 1000 * 250 = 250000 clocks
	DEC r17
	BRNE delay_2

;; delay 80 * 250000 = 20000000 (1seg)
	DEC r16
	BRNE delay_1
RET
