*-----------------------------------------------------------
* Title      :
* Written by :
* Date       :
* Description:
*-----------------------------------------------------------
    ORG    $1000
START:                  ; first instruction of program
* Put program code here
    
    MOVE.L #500, $2000 #CARBON PARTS IN AIR 
    MOVE.L #1000, $6000   #BUDGET
    
    MOVE.L #5, $3000    #QUANTITY OF WINDMILLS
    MOVE.L  #50, $4000 #CARBON REDUCTION OF WINDMILLS
    MOVE.L #100, $5000 #COST OF WINDMILLS
    
    MOVE.L #10, $3010   #QUANTITY OF SOLAR PANELS
    MOVE.L #25, $4010   #CARBON REDUCTION OF SOLAR PANELS
    MOVE.L #50, $5010 #COST OF SOLAR PANELS
    
    MOVE.L #5, $3020 #QUANTITY OF TREES
    MOVE.L #5, $4020 #CARBON REDUCTION OF TREES
    MOVE.L #10, $5020 #COST OF TREES






    BSR DATA_DISPLAY
    BSR MENU
    BSR DATA_DISPLAY
    
    LEA TEST,A1
    MOVE.B #14, D0
    TRAP #15
    
TEST DC.B 'BACK AT START',0
    
    
 
    
MENU:
    LEA CHOICE,A1
    BSR PRINT
    
    BSR STORE #STORE CHOICE IN D1
    
    CMP #1, D1
    BEQ PURCHASE_TREES
    
    CMP #2, D1
    BEQ PURCHASE_SOLAR
    
    CMP #3, D1
    BEQ  PURCHASE_WINDMILLS
    BGT ERROR
    
    
    
    
    
PURCHASE_TREES:
    BSR CLEAR_SCREEN
    
    LEA BUYTREE, A1
    BSR PRINT
    
    MOVE #4, D0 #STORE HOW MANY TREES TO BUY
    TRAP #15
    MOVE.L D1, D4 #STORE NUMBER OF TREES BOUGHT FOR LATER
    
    MOVE.L $3020, D2 #MOVE CURRENT TREES TOTAL TO D2
    ADD D2, D1 
    MOVE.L D1, $3020
    
    LEA BUYTREE2,A1 #TOTAL OF TREES ALREADY
    BSR PRINT
   
    MOVE #3, D0 #MOVE TREE TOTAL FROM REGISTER TO MEMORY
    MOVE.L $3020, D1 #PRINT TOTAL TREES
    TRAP #15
    
    LEA BUYTREE3,A1 #CLOSING LINE
    BSR PRINT
    
    MOVE.L $5020, D3 #MOVE COST OF TREES TO D3
    MULU D3, D4 #CALCULATE COST OF BUYING NEW TREES
    
    MOVE.L $6000, D3 #MOVE CURRENCY TO D4
    SUB D4, D3 #SUBTRACT PURCHASE OF TREES FROM MONEY
    
    MOVE.L D3, $6000 #STORE NEW MONEY VALUE IN MEMORY 
    
    LEA COINREM1,A1 #YOU HAVE SPENT
    BSR PRINT
    
    MOVE #3,D0 #PRINT COINS SPENT
    MOVE.L D4,D1
    TRAP #15
    
    LEA COINREM2,A1 
    BSR PRINT
    
    MOVE #3,D0 #PRINT COINS REMAINING
    MOVE.L D3,D1
    TRAP #15
    
    LEA COINREM3,A1 #CLOSING SENTENCE
    BSR PRINT
    
    RTS #RETURN FROM SUBROUTINE(BRINGS TO START)
    
PURCHASE_SOLAR:
    BSR CLEAR_SCREEN
    LEA BUYSOLAR, A1
    BSR PRINT
    
    MOVE #4, D0 #STORE HOW MANY SOLAR PANELS TO BUY
    TRAP #15
    MOVE.L D1, D4 #STORE NUMBER OF SOLAR BOUGHT FOR LATER
    

    MOVE.L $3010, D2 #ADD TO SOLAR TOTAL
    ADD D2, D1
    MOVE.L D1, $3010
    
    LEA BUYSOLAR2,A1 #TOTAL OF SOLAR ALREADY
    BSR PRINT
    
    MOVE #3, D0 #MOVE SOLAR TOTAL FROM REGISTER TO MEMORY
    MOVE.L $3010, D1 #PRINT TOTAL SOLAR
    TRAP #15
    
    LEA BUYSOLAR3,A1 #CLOSING LINE
    BSR PRINT
    
    MOVE.L $5010, D3 #MOVE COST OF SOLAR TO D3
    MULU D3, D4 #CALCULATE COST OF BUYING NEW SOLAR
    
    MOVE.L $6000, D3 #MOVE CURRENCY TO D4
    SUB D4, D3 #SUBTRACT PURCHASE OF SOLAR FROM MONEY
    
    MOVE.L D3, $6000 #STORE NEW MONEY VALUE IN MEMORY 
    
    LEA COINREM1,A1 #YOU HAVE SPENT
    BSR PRINT
    
    MOVE #3,D0 #PRINT COINS SPENT
    MOVE.L D4,D1
    TRAP #15
    
    LEA COINREM2,A1 
    BSR PRINT
    
    MOVE #3,D0 #PRINT COINS REMAINING
    MOVE.L D3,D1
    TRAP #15
    
    LEA COINREM3,A1 #CLOSING SENTENCE
    BSR PRINT
    
    RTS #RETURN FROM SUBROUTINE(BRINGS TO START)

    
PURCHASE_WINDMILLS:
    BSR CLEAR_SCREEN
    LEA BUYWINDMILLS, A1
    BSR PRINT
    
    MOVE #4, D0 #STORE HOW MANY WINDMILLS TO BUY
    TRAP #15
    MOVE.L D1, D4 #STORE NUMBER OF WINDMILLS BOUGHT FOR LATER
    

    MOVE.L $3000, D2 #ADD TO WINDMILL TOTAL
    ADD D2, D1
    MOVE.L D1, $3000
    
    LEA BUYWINDMILLS2,A1 #TOTAL OF WINDMILLS ALREADY STORED
    BSR PRINT
    
    MOVE #3, D0 #MOVE WINDMILL TOTAL FROM REGISTER TO MEMORY
    MOVE.L $3000, D1 #PRINT TOTAL WINDMILL
    TRAP #15
    
    LEA BUYWINDMILLS3,A1 #CLOSING LINE
    BSR PRINT
    
    MOVE.L $5000, D3 #MOVE COST OF WINDMILLS TO D3
    MULU D3, D4 #CALCULATE COST OF BUYING NEW WINDMILLS
    
    MOVE.L $6000, D3 #MOVE CURRENCY TO D4
    SUB D4, D3 #SUBTRACT PURCHASE OF WINDMILLS FROM MONEY
    
    MOVE.L D3, $6000 #STORE NEW MONEY VALUE IN MEMORY 
    
    LEA COINREM1,A1 #YOU HAVE SPENT
    BSR PRINT
    
    MOVE #3,D0 #PRINT COINS SPENT
    MOVE.L D4,D1
    TRAP #15
    
    LEA COINREM2,A1 
    BSR PRINT
    
    MOVE #3,D0 #PRINT COINS REMAINING
    MOVE.L D3,D1
    TRAP #15
    
    LEA COINREM3,A1 #CLOSING SENTENCE
    BSR PRINT
    
    RTS #RETURN FROM SUBROUTINE(BRINGS TO START)

DATA_DISPLAY:
    LEA DD1, A1 #PRINT TITLE BOX
    BSR PRINT
    
    LEA DD2,A1 #MOVE MESSAGE TO A1
    BSR PRINT
    MOVE #3,D0 #PRINT COINS REMAINING
    MOVE.L $6000,D1
    TRAP #15
    
    LEA DD3,A1 #MOVE MESSAGE TO A1
    BSR PRINT
    MOVE #3,D0 #PRINT CARBON LEVELS
    MOVE.L $2000,D1
    TRAP #15
   
    LEA DD4,A1 #MOVE MESSAGE TO A1
    BSR PRINT
    MOVE #3,D0 #PRINT QUANTITY OF TREES
    MOVE.L $3020,D1
    TRAP #15
    
    LEA DD5,A1 #MOVE MESSAGE TO A1
    BSR PRINT
    MOVE #3,D0 #PRINT QUANTITY OF SOLAR PANELS 
    MOVE.L $3010,D1
    TRAP #15
    
    LEA DD6,A1 #MOVE MESSAGE TO A1
    BSR PRINT
    MOVE #3,D0 #PRINT QUANTITY OF WINDMILLS 
    MOVE.L $3000,D1
    TRAP #15
    
    LEA DD7,A1 #MOVE MESSAGE TO A1
    BSR PRINT
    
    
    RTS #RETURN FROM SUBROUTINE
    
    
    SIMHALT             ; halt simulator

* Put variables and constants here
*--------------------------------------------------
*----------------SUBROUTINES-----------------------
*--------------------------------------------------
PRINT:
    DC.B $0D,$0A,0
    MOVE.B #14, D0
    TRAP #15
    RTS
    
STORE:
    MOVE #4, D0
    TRAP #15
    RTS
    
CLEAR_SCREEN:
    MOVE.B #11, D0
    MOVE.W #$FF00, D1
    TRAP #15
    RTS
    
ERROR:
    BSR CLEAR_SCREEN
    LEA ERROR1, A1
    BSR PRINT
    BSR MENU
 
*-----------------------------------------------
*------------DATA DISPLAY-----------------------
*-----------------------------------------------

DD1 DC.B $0D,$0A
    DC.B '--------------------------------------'
    DC.B $0D,$0A
    DC.B '----------------INFO------------------'
    DC.B $0D,$0A
    DC.B '--------------------------------------'
    DC.B $0D,$0A,0
DD2 DC.B '-COINS REMAINING: ',0
DD3 DC.B $0D,$0A
    DC.B '-CARBON LEVELS /PPM: ',0
DD4 DC.B $0D,$0A
    DC.B '-QUANTITY OF TREES: ',0
DD5 DC.B $0D,$0A
    DC.B '-QUANTITY OF SOLAR PANELS: ',0
DD6 DC.B $0D,$0A
    DC.B '-QUANTITY OF WINDMILLS: ',0
DD7 DC.B $0D,$0A
    DC.B '--------------------------------------'
    DC.B $0D,$0A
    DC.B $0D,$0A,0
 
*-----------------------------------------------------------------------------
*--------------------------PRINT TO SCREEN------------------------------------
*-----------------------------------------------------------------------------

CHOICE DC.B 'DO YOU WANT TO PURCHASE (1)TREES, (2)SOLAR OR (3) WINDMILLS? ',0

BUYTREE DC.B 'HOW MANY TREES WOULD YOU LIKE TO PURCHASE? ',0
BUYTREE2 DC.B 'YOU NOW HAVE A TOTAL OF ',0
BUYTREE3 DC.B ' TREES! ',0

BUYSOLAR DC.B 'HOW MANY SOLAR PANELS WOULD YOU LIKE TO BUY? ',0
BUYSOLAR2 DC.B 'YOU NOW HAVE A TOTAL OF ',0
BUYSOLAR3 DC.B ' SOLAR PANELS! ',0

BUYWINDMILLS DC.B 'HOW MANY WINDMILLS WOULD YOU LIKE TO BUY? ',0
BUYWINDMILLS2 DC.B 'YOU NOW HAVE A TOTAL OF ',0
BUYWINDMILLS3 DC.B ' WINDMILLS! ',0

COINREM1 DC.B $0D,$0A
         DC.B 'YOU HAVE SPENT ',0
COINREM2 DC.B ' COINS, AND HAVE ',0
COINREM3 DC.B ' COINS REMAINING',0

ERROR1  DC.B 'ERROR: INCORRECT NUMBER, PLEASE TRY AGAIN'
        DC.B $0D,$0A,0
    END    START        ; last line of source

*~Font name~Courier New~
*~Font size~10~
*~Tab type~1~
*~Tab size~4~
