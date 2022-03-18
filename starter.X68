*-----------------------------------------------------------
* Title      :
* Written by :
* Date       :
* Description:
*-----------------------------------------------------------
    ORG    $1000
START:                  ; first instruction of program

* Put program code here

    MOVE.L  #500, $2000     #CARBON PARTS
    
    MOVE.L #100000, $6000   #COINS
   
    MOVE.L #5, $3000    #QUANTITY OF WINDMILLS
    MOVE.L  #50, $4000 #CARBON REDUCTION OF WINDMILLS
    MOVE.L #20000, $5000 #COST OF WINDMILLS

    MOVE.L #10, $3010   #QUANTITY OF SOLAR PANELS
    MOVE.L #20, $4010   #CARBON REDUCTION OF SOLAR PANELS
    MOVE.L #10000, $5010 #COST OF SOLAR PANELS

    MOVE.L #1000, $3020 #QUANTITY OF TREES
    MOVE.L #10, $4020 #CARBON REDUCTION OF TREES
    MOVE.L #50, $5020 #COST OF TREES


*-------------------------------------------------------
*-------------------QUEST LVL 1-------------------------
*-------------------------------------------------------
    BSR CLEAR_SCREEN
    
    LEA CARBONPPM,A1
    MOVE.B #14,D0
    TRAP #15    
    





    SIMHALT             ; halt simulator



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

    CMP #0, D2
    BNE GAME_LOOP
    *BRA SAVED_THE_WORLD




* Put variables and constants here
*-------------------------------------------------------
*-------------------MISC SUBROUTINES--------------------
*-------------------------------------------------------
CLEAR_SCREEN: 
    MOVE.B  #11,D0      CLEAR SCREEN
    MOVE.W  #$FF00,D1
    TRAP    #15
    RTS


CARBONPPM:
    MOVE.L $2000,D2
    TRAP #15
    DC.B 














    END    START        ; last line of source

*~Font name~Courier New~
*~Font size~10~
*~Tab type~1~
*~Tab size~4~
