*-----------------------------------------------------------
* Title      :
* Written by :
* Date       :
* Description:
*-----------------------------------------------------------
    ORG    $1000
START:                  ; first instruction of program
* Put program code here
    
    MOVE.L #1000, $2000 #CARBON PARTS IN AIR 
    MOVE.L #1000, $6000   #BUDGET
    
    MOVE.L #0, $3000    #QUANTITY OF WINDMILLS
    MOVE.L  #50, $4000 #CARBON REDUCTION OF WINDMILLS
    MOVE.L #100, $5000 #COST OF WINDMILLS
    
    MOVE.L #0, $3010   #QUANTITY OF SOLAR PANELS
    MOVE.L #25, $4010   #CARBON REDUCTION OF SOLAR PANELS
    MOVE.L #50, $5010 #COST OF SOLAR PANELS
    
    MOVE.L #5, $3020 #QUANTITY OF TREES
    MOVE.L #5, $4020 #CARBON REDUCTION OF TREES
    MOVE.L #10, $5020 #COST OF TREES


    BSR INTRO
    
GAME: 
    BSR GAME_LOOP 
    BSR DATA_DISPLAY
    BSR MENU
    BSR GAME_LOOP 
    
INTRO:
    LEA INTRO1,A1
    BSR PRINT
    
    MOVE #4, D0
    TRAP #15
    
    CMP #1, D1 
    BEQ PLAY
    
    CMP #0, D1
    BEQ CHICKEN_OUT
    
    BSR ERROR2
    
PLAY:
    BSR CLEAR_SCREEN
    LEA PLAY1,A1
    BSR PRINT
    
    LEA PLAY2,A1
    BSR PRINT
    
    MOVE #4, D0  
    TRAP #15
    
    CMP #1,D1
    BEQ GAME
    
    BSR ERROR

MENU:
    LEA CHOICE,A1                   #LOAD EFFECTIVE ADDRESS AND STORE IN A1
    BSR PRINT                       #BRANCH TO PRINT SUBROUTINE, STORE IN D0
    
    MOVE #4, D0 
    TRAP #15                       #STORE INPUT IN D1
    
    CMP #1, D1                      #COMPARE VALUE IN D1 WITH INTEGER 1 
    BEQ PURCHASE_TREES              #BRANCH IF D1 IS EXACTLY EQUAL WITH 1
    
    CMP #2, D1                      #COMPARE D1 WITH 2
    BEQ PURCHASE_SOLAR              #BRANCH IF D1 IS EXACTLY EQUAL WITH 2
    
    CMP #3, D1                      #COMPARE D1 WITH 3
    BEQ  PURCHASE_WINDMILLS         # BRANCH IF D1 IS EXACTLY EQUAL WITH 3
    
    BGT ERROR                       #BRANCH TO ERROR SUBROUTINE(NO MATCHING NUMBERS)
    
    RTS
    

    
PURCHASE_TREES:
    BSR CLEAR_SCREEN                #BRANCH TO CLEAR SCREEN ROUTINE
    
    LEA BUYTREE, A1                 #ASK USER HOW MANY TREES WOULD THEY LIKE TO BUY
    BSR PRINT                       #CALL PRINT SUBROUTINE 
    
    MOVE #4, D0                     #STORE HOW MANY TREES TO BUY
    TRAP #15
    MOVE.L D1, D4                   #STORE NUMBER OF TREES BOUGHT FOR LATER
    
    MOVE.L $3020, D2                #MOVE CURRENT TREES TOTAL TO D2
    ADD D2, D1 
    MOVE.L D1, $3020
    
    LEA BUYTREE2,A1                 #TOTAL OF TREES ALREADY
    BSR PRINT
   
    MOVE #3, D0                     #MOVE TREE TOTAL FROM REGISTER TO MEMORY
    MOVE.L $3020, D1                #PRINT TOTAL TREES
    TRAP #15
    
    LEA BUYTREE3,A1                 #CLOSING STATMENT FOR TREES PURCHASED
    BSR PRINT
    
    MOVE.L $5020, D3                #MOVE COST OF TREES TO D3
    MULU D3, D4                     #CALCULATE COST OF BUYING NEW TREES
    
    MOVE.L $6000, D3                #MOVE CURRENCY TO D4
    SUB D4, D3                      #SUBTRACT PURCHASE OF TREES FROM MONEY
    
    MOVE.L D3, $6000                #STORE NEW MONEY VALUE IN MEMORY 
    
    LEA COINREM1,A1                 #YOU HAVE SPENT STRING
    BSR PRINT
    
    MOVE #3,D0                      #PREPARE TO PRINT AN INTEGER
    MOVE.L D4,D1                    #MOVE D4 TO D1 
    TRAP #15                        #PRINT TO SCREEN 
    
    LEA COINREM2,A1                 #REST OF SPENT STRING
    BSR PRINT                       #BRANCH TO PRINT STATMENT 
    
    MOVE #3,D0                      #PRINT COINS REMAINING
    MOVE.L D3,D1
    TRAP #15
    
    LEA COINREM3,A1                 #CLOSING SENTENCE
    BSR PRINT
    
    LEA CON,A1
    BSR PRINT
    MOVE #4, D0 
    TRAP #15
    CMP #1,D1
    BEQ GAME
    ;RTS                             #RETURN FROM SUBROUTINE(BRINGS TO START)
    
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
    
    LEA CON,A1
    BSR PRINT
    MOVE #4, D0 
    TRAP #15
    CMP #1,D1
    BEQ GAME
    ;RTS #RETURN FROM SUBROUTINE(BRINGS TO START)

    
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
    
    LEA CON,A1
    BSR PRINT
     MOVE #4, D0 
    TRAP #15
    CMP #1,D1
    BEQ GAME
    
    BSR ERROR
    ;RTS #RETURN FROM SUBROUTINE(BRINGS TO START)
    
GAME_LOOP:

    MOVE.L  $2000, D2   #CARBON PARTS
    MOVE.L $3000, D3    #QUANTITY OF WINDMILLS  
    MOVE.L  $4000, D4   #CARBON REDUCTION OF WINDMILLS
    
    MULU    D3, D4 #CARBON REDUCTION FOR WINDMILLS
    SUB D4, D2  #REDUCTION OF CARBON IN AIR
  
    MOVE.L $3010, D3    #QUANTITY OF SOLAR PANELS 
    MOVE.L  $4010, D4   #CARBON REDUCTION OF SOLAR PANELS
    
    MULU    D3, D4 #CARBON REDUCTION FOR SOLAR PANELS
    SUB D4, D2  #REDUCTION OF CARBON IN AIR
    
    MOVE.L $3020, D3    #QUANTITY OF TREES
    MOVE.L  $4020, D4   #CARBON REDUCTION OF TREES
    
    MULU    D3, D4 #CARBON REDUCTION FOR TREES
    SUB D4, D2  #REDUCTION OF CARBON IN AIR
    
    MOVE.L D2, $2000 #STORE NEW CARBON VALUE AFTER SUB WINDMILLS, SOLAR AND TREES REDUCTION

    CMP #50, D2
    BLT GAME_WIN
        
    RTS

DATA_DISPLAY:
    BSR CLEAR_SCREEN
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
    
GAME_WIN:
    BSR CLEAR_SCREEN
    LEA WIN1, A1
    BSR PRINT
    BSR END
    
CHICKEN_OUT:
    BSR CLEAR_SCREEN
    LEA CHICKEN1, A1
    BSR PRINT
    
    
    
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
ERROR2:
    BSR CLEAR_SCREEN
    LEA ERROR1, A1
    BSR PRINT
    BSR INTRO
 
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
INTRO1  DC.B '---WELCOME TO THIS TEXT BASED ADVENTURE GAME---'
        DC.B $0D,$0A
        DC.B $0D,$0A
        DC.B 'LET ME GIVE YOU THE RUN DOWN OF HOW TO PLAY,'
        DC.B $0D, $0A
        DC.B $0D, $0A
        DC.B 'LAST YEAR WE NOTICED A SIGNIFICANT INCREASE IN GLOBAL TEMPERATURE,'
        DC.B $0D,$0A
        DC.B 'THIS HAS CAUSED ICE IN THE SEA TO MELT'
        DC.B $0D,$0A
        DC.B 'AND NOW OUR CITY IS IN DANGER OF BEING SUBMERGED'
        DC.B $0D,$0A
        DC.B $0D,$0A
        DC.B 'DO YOU THINK YOUR UP TO THE TASK OF SAVING OUR CITY?'
        DC.B $0D,$0A        
        DC.B 'PRESS (1) TO PLAY OR (0) TO CHICKEN OUT ',0
      

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

WIN1  DC.B $0D,$0A
      DC.B 'CONGRATS',0
      
CHICKEN1 DC.B 'WOW, JUST LIKE THAT YOU CHICKENED OUT'
         DC.B $0D,$0A
         DC.B 'HOPE YOU CAN SWIM!',0
         
PLAY1    DC.B 'GLAD TO SEE YOUR UP TO THE TASK OF SAVING THE WORLD!'
         DC.B $0D,$0A
         DC.B $0D,$0A
         DC.B 'YOUR MISSION IS TO REDUCE THE CARBON LEVELS IN THE AIR'
         DC.B $0D,$0A
         DC.B 'YOU HAVE 1000 COINS IN THE BANK'
         DC.B $0D,$0A
         DC.B 'YOU CAN BUY TREES, SOLAR PANELS AND WINDMILLS WITH THIS.'
         DC.B $0D,$0A
         DC.B $0D,$0A
         DC.B 'TREES COST 10 COINS AND REDUCE CARBON BY 5/PPM EVERY DAY'         
         DC.B $0D,$0A
         DC.B 'SOLAR PANELS COST 50 COINS AND REDUCE CARBON BY 25/PPM EVERY DAY'
         DC.B $0D,$0A
         DC.B 'WINDMILLS COST 100 COINS AND REDUCE CARBON BY 50/PPM EVERY DAY',0
PLAY2    DC.B $0D,$0A
         DC.B $0D,$0A
         DC.B 'PRESS (1) TO START',0


ERROR1  DC.B 'ERROR: INCORRECT NUMBER, PLEASE TRY AGAIN'
        DC.B $0D,$0A,0
        DC.B $0D,$0A,0
CON     DC.B $0D,$0A
        DC.B $0D,$0A
        DC.B 'PRESS (1) TO CONTINUE... ',0
        
END:
    END    START        ; last line of source


*~Font name~Courier New~
*~Font size~10~
*~Tab type~1~
*~Tab size~4~
© 2022 GitHub, Inc.


*~Font name~Courier New~
*~Font size~10~
*~Tab type~1~
*~Tab size~4~
