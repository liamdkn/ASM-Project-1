*-----------------------------------------------------------
* Title      : ASM Project 1
* Written by : Liam Durkan
* Date       : 9/2/22
* Description: Write a test based game to save the worlds climate crisis
*-----------------------------------------------------------
    ORG    $1000
START:                  ; first instruction of program

    MOVE.L  #5000000, $2000     #CARBON PARTS
    
    MOVE.L #100000, $6000   #BUDGET
   
    MOVE.L #5, $3000    #QUANTITY OF WINDMILLS
    MOVE.L  #45, $4000 #CARBON REDUCTION OF WINDMILLS
    MOVE.L #15000, $5000 #COST OF WINDMILLS

    MOVE.L #10, $3010   #QUANTITY OF SOLAR PANELS
    MOVE.L #22, $4010   #CARBON REDUCTION OF SOLAR PANELS
    MOVE.L #2500, $5010 #COST OF SOLAR PANELS

    MOVE.L #1000, $3020 #QUANTITY OF TREES
    MOVE.L #6, $4020 #CARBON REDUCTION OF TREES
    MOVE.L #50, $5020 #COST OF TREES
    

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
    BRA SAVED_THE_WORLD
    
    SAVED_THE_WORLD:
        LEA MESSAGE,  A1  #DISPLAY SAVED THE WORLD
        MOVE.B #14, D0
        TRAP #15
        BRA END
        
END:
    SIMHALT
MESSAGE DC.B 'YOU HAVE SAVED THE WORLD' , 0

    END    START        ; last line of source

*~Font name~Courier New~
*~Font size~10~
*~Tab type~1~
*~Tab size~4~
