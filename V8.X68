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
    
    MOVE.L #100000, $6000   #BUDGET
   
    MOVE.L #5, $3000    #QUANTITY OF WINDMILLS
    MOVE.L  #45, $4000 #CARBON REDUCTION OF WINDMILLS
    MOVE.L #15000, $5000 #COST OF WINDMILLS

    MOVE.L #10, $3010   #QUANTITY OF SOLAR PANELS
    MOVE.L #22, $4010   #CARBON REDUCTION OF SOLAR PANELS
    MOVE.L #2500, $5010 #COST OF SOLAR PANELS

    MOVE.L #5, $3020 #QUANTITY OF TREES
    MOVE.L #6, $4020 #CARBON REDUCTION OF TREES
    MOVE.L #50, $5020 #COST OF TREES
    
    
PURCHASE:
    LEA P1,A1 #WHAT TO BUY
    MOVE.B #14,D0
    TRAP #15
        
    
    MOVE #4,D0 #CHOICE WHAT TO BUY
    TRAP #15
    
    CMP #1, D1
    BEQ BUY_TREES
    
    CMP #2, D1
    BEQ BUY_SOLAR
    
    CMP #3, D1
    BEQ BUY_WINDMILLS
    
P1 DC.B 'DO YOU WANT TO PURCHASE (1)TREES, (2)SOLAR PANELS, (3) WINDMILLS',0
    
    
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
        LEA MESSAGE,  A2  #DISPLAY SAVED THE WORLD
        MOVE.B #14, D0
        TRAP #15
        BRA END 
        
END:
    SIMHALT ;HALT SIMULATOR 
* Put variables and constants here
BUY_TREES:
    LEA CRLF,A1
    LEA BUYTREES,A1
    MOVE.B #14, D0
    TRAP #15
    
    MOVE.L #4,D3 #STORE HOW MANY TREES TO BUY
    TRAP #15
    
    MOVE.L $3020, D4 #MOVE QUANTITY OF TREES TO D1
    ADD D3, D4 
    
    
CRLF:           DC.B    $0D,$0A,0
ENDL:
    MOVEM.L D0/A1,-(A7)
    MOVE    #14,D0
    LEA     CRLF,A1
    TRAP    #15
    MOVEM.L (A7)+,D0/A1
    RTS
    
BUY_SOLAR:

BUY_WINDMILLS:






BUYTREES DC.B 'HOW MANY TREES DO YOU WANT TO BUY',0
MESSAGE DC.B 'YOU HAVE SAVED OUR CITY' , 0

    END    START        ; last line of source

*~Font name~Courier New~
*~Font size~10~
*~Tab type~1~
*~Tab size~4~
