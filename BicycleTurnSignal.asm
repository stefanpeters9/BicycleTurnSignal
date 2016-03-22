;**** Timer **** 
TSCR1 EQU $46
TSCR2 EQU $4D
TIOS  EQU $40
TCTL1 EQU $48
TCTL2 EQU $49
TFLG1 EQU $4E
TIE   EQU $4C
TSCNT EQU $44
TC4	  EQU $58
TC1	  EQU $52
;***************

;*** PORTS **** 
DDRA  EQU $02
PORTA EQU $00
PORTB EQU $01
DDRB  EQU $03
PORTM EQU $0250
DDRM  EQU $0252
;**************

;****************VARIABLES*************

RIGHT ds 1
LEFT ds 1
ONOFF ds 1
;**************INITIALIZATION*********

		LDAA #$FF			   ; Initialize port A for output
		STAA DDRA							  
		
;****************MAIN LOOP*************

	;START TIMER
	;ONOFF VARIABLE 
	; VARIABLES RIGHT LEFT 
TOP ;IF (BRAKE=1) LEFT=1 RIGHT=1
	;ELSE IF (TIMER >= 500ms)
		  AND IF(LEFTBUTTON=1 AND ONOFF=1)
		  	  LEFT=1
			  IF(RIGHTBUTTON=1 AND ONOFF=1)
			  RIGHT=1
			  IF (ONOFF = 0)
		 	  LEFT=0
		 	  RIGHT=0
		  OLDTIMER=TIMER
          TOGGLE ONOFF	
		     
	BRA TOP
