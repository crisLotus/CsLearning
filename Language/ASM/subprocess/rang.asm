_rand_:
	;bxΪ�����
	PUSH CX
    PUSH DX
    PUSH AX
    STI
    MOV AH,0             ;��ʱ�Ӽ�����ֵ
    INT 1AH
    MOV AX,DX            ;���6λ
    AND AH,3
    MOV DL,101           ;��101������0~100����
    DIV DL
    MOV BL,AH            ;������BX���������
    POP AX
    POP DX
    POP CX
    RET