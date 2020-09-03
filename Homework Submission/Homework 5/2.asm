.MODEL SMALL 
.STACK 100H 
.DATA 
    PROMPT_1 DB "Enter num 1: $" 
    PROMPT_2 DB 0AH, 0DH, "Enter num 2: $" 
    PROMPT_3 DB 0AH, 0DH, "Sum: $" 
.CODE 
    MAIN PROC
        MOV AX, @DATA 
        MOV DS, AX 
         
        LEA DX, PROMPT_1 
        MOV AH, 09H 
        INT 21H 
         
        MOV AH, 01H 
        INT 21H 
         
        SUB AL, 30H 
        MOV BH, AL 
         
        MOV AH, 01H 
        INT 21H 
         
        SUB AL, 30H 
        MOV BL, AL
         
        LEA DX, PROMPT_2 
        MOV AH, 09H 
        INT 21H 
         
        MOV AH, 01H 
        INT 21H 
         
        SUB AL, 30H 
        MOV CH, AL 
         
        MOV AH, 01H 
        INT 21H 
         
        SUB AL, 30H 
        MOV CL, AL 
         
        ADD BL, CL 
         
        MOV AL, BL 
        MOV AH, 00H 
        AAA 
         
        MOV CL, AL
        MOV BL, AH 
         
        ADD BL, BH 
        ADD BL, CH 
         
        MOV AL, BL 
        MOV AH, 00H 
        AAA 
         
        MOV BX, AX 
        
        LEA DX, PROMPT_3 
        MOV AH, 09H 
        INT 21H 
         
        MOV DL, BH 
        ADD DL, 30H 
        MOV AH, 02H 
        INT 21H 
         
        MOV DL, BL 
        ADD DL, 30H 
        MOV AH, 02H 
        INT 21H 
         
        MOV DL, CL 
        ADD DL, 30H 
        MOV AH, 02H 
        INT 21H 
     
        MOV AH, 04CH 
        INT 21H
        
    MAIN ENDP 
END MAIN