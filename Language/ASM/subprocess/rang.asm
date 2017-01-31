_rand_:
	;bx为随机数
	PUSH CX
    PUSH DX
    PUSH AX
    STI
    MOV AH,0             ;读时钟计数器值
    INT 1AH
    MOV AX,DX            ;清高6位
    AND AH,3
    MOV DL,101           ;除101，产生0~100余数
    DIV DL
    MOV BL,AH            ;余数存BX，作随机数
    POP AX
    POP DX
    POP CX
    RET