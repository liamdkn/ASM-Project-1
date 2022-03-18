*-----------------------------------------------------------
* Title      :
* Written by :
* Date       :
* Description:
*-----------------------------------------------------------
    ORG    $1000
START:                  ; first instruction of program

    BRA WELCOME
    
    MOVE.L  #5148, $2000     #CARBON PARTS
   
    
  

    SIMHALT             ; halt simulator

* Put variables and constants here







*-------------------------------------------------------
*-------------------WELCOME SUBROUTINE------------------
*-------------------------------------------------------
WELCOME:
    BSR     ENDL            BRANCH TO ENDL SUBROUTINE
    LEA     WELCOME_MSG,A1  ASSIGN MESSAGE TO ADDRESS REGISTER A1
    MOVE.B  #14,D0          MOVE LITERAL 14 TO DO
    TRAP    #15             TRAP AND INTERPRET VALUE IN D0
    BSR     ENDL            BRANCH TO ENDL SUBROUTINE
     

    MOVE #4, D0
    TRAP #15                COLLECT QUEST CODES 
                
    CMP #1, D1 # COMPARE WITH 1
    BLT START
    CMP #3, D1 # COMPARE WITH 3
    BGT START
    BRA QUEST_LVL
    
*-------------------------------------------------------
*-------------------QUEST LVL---------------------------
*-------------------------------------------------------    
QUEST_LVL:    
            CMP #1, D1
            BEQ LVL_1
    
            CMP #2, D1
            BEQ LVL_2
    
            CMP #3, D1
            BEQ LVL_3
    
            BRA WELCOME    

*-------------------------------------------------------
*-------------------QUEST LVL 1-------------------------
*-------------------------------------------------------
LVL_1:
    BSR CLEAR_SCREEN
    
    LEA     LVL1_1,A1  ASSIGN MESSAGE TO ADDRESS REGISTER A1
    MOVE.B  #14,D0     MOVE LITERAL 14 TO DO
    TRAP    #15
    
    MOVE #4, D1
    TRAP #15
    
    CMP #1, D1
    BEQ CONTINUE_LVL1
    
    CMP #2, D1
    BEQ CHICKEN_OUT
    
    BRA LVL_1

CONTINUE_LVL1:

*-------------------------------------------------------
*-------------------QUEST LVL 2-------------------------
*-------------------------------------------------------
LVL_2:

*-------------------------------------------------------
*-------------------QUEST LVL 3-------------------------
*-------------------------------------------------------
LVL_3:


*-------------------------------------------------------
*-------------------MISC SUBROUTINES--------------------
*-------------------------------------------------------
CHICKEN_OUT:
    LEA CHICKEN,A1
    MOVE.B  #14,D0          
    TRAP    #15   
ENDL:
    MOVEM.L D0/A1,-(A7)
    MOVE    #14,D0
    LEA     CRLF,A1
    TRAP    #15
    MOVEM.L (A7)+,D0/A1
    RTS
CLEAR_SCREEN: 
    MOVE.B  #11,D0      CLEAR SCREEN
    MOVE.W  #$FF00,D1
    TRAP    #15
    RTS
*-------------------------------------------------------
*-------------------STORYLINE---------------------------
*-------------------------------------------------------

CRLF:           DC.B    $0D,$0A,0
WELCOME_MSG:    DC.B    '************************************************************'
                DC.B    $0D,$0A
                DC.B    'STRATEGY GAME TO SAVE THE EARTH FROM ENVIROMENTAL DISASTER'
                DC.B    $0D,$0A
                DC.B    '************************************************************'
                DC.B    $0D,$0A
                DC.B    $0D,$0A
                DC.B    'PRESS (1) TO START A NEW GAME OR ENTER QUEST CODE '
                DC.B    $0D,$0A
                DC.B    'TO RETURN TO GAME: ',0
                
                
LVL1_1       DC.B    'FINALLY YOU HAVE ARRIVED, WE HAVE BEEN WAITING ON YOU...'
             DC.B    $0D,$0A
             DC.B    'OOVER THE PAST DECADE A STEADY INCREASE IN TEMPERATURE HAS BEEN RECORDED,'
             DC.B    $0D,$0A
             DC.B    'LAST YEAR WE NOTICED A RISE IN SEA LEVELS'
             DC.B    $0D,$0A
             DC.B    'OUR CITY IS IN GRAVE DANGER OF BEING SUBMERGED AND WITHOUTH YOUR HELP WE WILL LOSE EVERYTHING'        
             DC.B    $0D,$0A
             DC.B    $0D,$0A
             DC.B    'YOU ARE OUR LAST HOPE WE NEED YOUR HELP!'             
             DC.B    $0D,$0A
             DC.B    'PRESS (1) TO HELP SAVE THE CITY OR (2) TO CHICKEN OUT. ',0
             
CHICKEN:     DC.B 'DIDNT EXPECT THAT, DAFE TO SAY IM EMBARRASED FOR YOU',0

    END    START        ; last line of source

*~Font name~Courier New~
*~Font size~10~
*~Tab type~1~
*~Tab size~4~
