include 'emu8086.inc'
.STACK 100h
.MODEL SMALL

.data 

.code
 MAIN PROC
    
    PRINT 'ENTER A NUMBER:'
    
    MOV AH, 01h
    int 21h
    
    MOV BL, AL
    SUB BL, 48
    
    MOV DL, 10
    MOV AH, 02H
    INT 21H
    
    MOV DL, 13
    MOV AH, 02H
    INT 21H
    
    PRINT 'ENTER ANOTHER NUMBER:' 
    
    MOV AH, 01H
    INT 21H
    SUB AL,48
    
    MUL BL
    
    MOV BL, AL
    
    ADD BL, 48
    

   MAIN ENDP
 END MAIN