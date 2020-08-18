.MODEL SMALL
.STACK 100H 

.DATA
    PROMPT DB 'Digits: $'

.CODE
    MAIN PROC
       
    MOV AX, @DATA
    MOV DS, AX
    
    MOV AH, 09H
    MOV DX, OFFSET PROMPT
    INT 21H
    
    MOV CX, 10
    MOV AH, 02H
    MOV BH, 0
    
    MOV DL, '0'
    
    LOOP:
        INT 21H
        
        MOV BL,DL 
        
        MOV DL, 0AH
        INT 21H
        MOV DL, 0DH
        INT 21H 
        
        MOV DL, BL
        ADD BL, 10
        ADD BH, BL 
        
         
        INC DL
        DEC CX 
        
        JNZ LOOP 
        
    
    MOV AH, 02
    ADD BH, 30H
    MOV DL, BH
    INT 21H
    
    MOV AH, 01
    INT 21H    
    MOV AH, 4CH
    INT 21H
    
    MAIN ENDP
END MAIN