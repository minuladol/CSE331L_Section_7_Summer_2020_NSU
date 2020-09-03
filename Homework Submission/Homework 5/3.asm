
.MODEL SMALL
.STACK 100H 

.DATA
    PROMPT_1 DB 'Enter an integer: $'  
    PROMPT_2 DB 0DH,0AH,'The integer is: $' 
   
.CODE
    MAIN PROC
        MOV AX, @DATA
        MOV DS, AX  
        
        LEA DX, PROMPT_1
        MOV AH, 9
        INT 21H 
        
        MOV AH, 01H
        INT 21H 
        
        CMP AL, 0DH
        CMP AL, 2DH
        JNE @NEGATIVE

        MOV DH, AL
              
        MOV AH, 01H
        INT 21H
        
        CMP AL, 0DH
        JE @COMPARE   
        
        CMP AL, 2DH
        
        
@NEGATIVE:
        AND AL, 0FH
        MOV BH, AL
        
        MOV AH, 01H 
        INT 21H
        
        CMP AL, 0DH
        JE @COMPARE
        
        CMP AL, 2DH
        
        AND AL, 0FH
        MOV BL, AL
        MOV AH, 01H 

               
@COMPARE:
        MOV AL, BH
        MOV CL, 0AH
        MUL CL
        ADD BL, AL
        CMP DH, 2DH
        JE @NEGETIVE
        JMP @OUTPUT
         
@NEGETIVE:
        MOV BH, 00H
        NEG BL
        
@OUTPUT:
        MOV AH, 09H
        LEA DX, PROMPT_2
        INT 21H
        
        CMP BL, 00H
        JZ @ZERO
        JG @POSITIVE
        MOV DL, 'N'
        MOV AH, 02H
        INT 21H
        JMP @END 
        
        
@ZERO: MOV DL, 'Z'
            MOV AH, 02H
            INT 21H
            JMP @END 
            
@POSITIVE: MOV DL, 'P'
                MOV AH, 02H
                INT 21H
                JMP @END      

      
@END: HLT

    
    MAIN ENDP
END MAIN