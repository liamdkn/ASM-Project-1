*-----------------------------------------------------------
* Title      : FINAL
* Written by :
* Date       :
* Description:
*-----------------------------------------------------------
    ORG    $1000
START:                  ; first instruction of program
* Put program code here
    
    







    BSR MENU
    
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
    
    
    
PURCHASE_TREES:
    BSR CLEAR_SCREEN
    LEA BUYTREE, A1
    BSR PRINT 
    RTS
    
PURCHASE_SOLAR:
    BSR CLEAR_SCREEN
    LEA BUYSOLAR, A1
    BSR PRINT
    RTS
    
PURCHASE_WINDMILLS:
    BSR CLEAR_SCREEN
    LEA BUYWINDMILLS, A1
    BSR PRINT
    RTS

    
    
    SIMHALT             ; halt simulator

* Put variables and constants here
PRINT:
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
    
    
CHOICE DC.B 'DO YOU WANT TO PURCHASE (1)TREES, (2)SOLAR OR (3) WINDMILLS? ',0
BUYTREE DC.B 'HOW MANY TREES WOULD YOU LIKE TO PURCHASE? ',0
BUYSOLAR DC.B 'HOW MANY SOLAR PANELS WOULD YOU LIKE TO BUY? ',0
BUYWINDMILLS DC.B 'HOW MANY WINDMILLS WOULD YOU LIKE TO BUY? ',0
    END    START        ; last line of source

*~Font name~Courier New~
*~Font size~10~
*~Tab type~1~
*~Tab size~4~
