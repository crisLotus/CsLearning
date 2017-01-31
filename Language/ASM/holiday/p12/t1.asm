assume cs:codesg, ds:datasg, ss:stacksg

;template

codesg segment
start:	
	;init registor
	mov ax,datasg
	mov ds,ax	;ds:datasg
	mov ax,stacksg
	mov ss,ax	;ss:stacksg
	mov sp,100h	;sp:

	;your code
	mov cx,10000
	main_loop:
	call print_1_col
	loop main_loop
	mov ax,4c00h
	int 21h

print_1_col:
	jmp print_1_col_start
	print_1_col_col dw	0
	print_1_col_row dw	0
	
	print_1_col_start:
	push ax
	push bx
	push cx
	
	call _rand_row_
	mov cs:print_1_col_row,bx
	call _rand_col_
	mov cs:print_1_col_col,bx
	
	mov cx,10 ;start print_1_col_main_loop
	print_1_col_main_loop:
	call _rand_char_
	mov ax,2;att
	push ax
	mov ax,bx	;�������char
	push ax
	mov ax,cs:print_1_col_col;col
	push ax
	mov ax,cs:print_1_col_row;row
	push ax
	call _print_c_
	add cs:print_1_col_row,1
	loop print_1_col_main_loop
	
	pop cx
	pop bx
	pop ax
	ret
sleep_smal_time:
	;para times: 

	usage:
	mov ax,100h
	push ax
	call sleep_plus
	push bp
	mov bp,sp

	push cx	
	mov cx,ss:[bp+4]  ;ע�⣺�ı��cxֵ�ɸı���ʱ��ʱ�䳤��
	sleep_smal_time_s0:push cx
	mov cx,0ffffh
	sleep_smal_time_s1:sub dx,dx
	loop sleep_smal_time_s1
	pop cx
	loop sleep_smal_time_s0
	pop cx
	
	pop bp
	ret 2
	
	
_rand_plus:
	;bxΪ�����
	;usage:
	;mov ax,?
	;push ax
	;call _rand_plus
	jmp _rand_plus_start
	
	seed_ dw ?
	
	_rand_plus_start:
	push bp
	mov bp,sp
	PUSH CX
    PUSH DX
    PUSH AX
    STI
    MOV AH,0             ;��ʱ�Ӽ�����ֵ
    INT 1AH
    MOV AX,DX            ;���6λ
    AND AH,3
    mov dl,ss:[bp+4]
    add DL,1          ;��101������0~100����
    DIV DL
    MOV BL,AH            ;������BX���������
    
    POP AX
    POP DX
    POP CX
    pop bp
    RET 2
    
_rand_:
	;bxΪ�����
	push ax
	mov ax,101
	push ax
	call _rand_plus
	pop ax
    RET

_rand_char_:
	;bxΪ����ַ�
	push ax
	mov ax,128
	push ax
	call _rand_plus
	pop ax
    RET
    
_rand_row_:
	;bxΪ����ַ�
	push ax
	mov ax,25
	push ax
	call _rand_plus
	pop ax
    RET
    
_rand_col_:
	;bxΪ����ַ�
	push ax
	mov ax,80
	push ax
	call _rand_plus
	pop ax
    RET

sleep_plus:
	;para times: 

	;usage:
	;mov ax,10
	;push ax
	;call sleep_plus
	push bp
	mov bp,sp

	push cx	
	mov cx,ss:[bp+4]  ;ע�⣺�ı��cxֵ�ɸı���ʱ��ʱ�䳤��
	s0:push cx
	mov cx,0ffffh
	s1:sub dx,dx
	loop s1
	pop cx
	loop s0
	pop cx
	
	pop bp
	ret 2

_print_c_:
	;argc:
	;	row		4	�� 0-24
	;	col		6	�� 0-79
	;	char	8
	;	att		10	��ʾ����
	
	;Usage:
	;mov ax,2;att
	;push ax
	;mov ax,'c'
	;push ax
	;mov ax,79;col
	;push ax
	;mov ax,24;row
	;push ax
	;call _print_c_
	
	push bp
	mov bp,sp
	
	push es
	push di
	push ax
	push bx
	
	mov ax,0b800h
	mov es,ax
	mov ax,0a0h
	mul word ptr ss:[bp+4]	;row * 0b800h
	mov bx, ax
	
	mov ax,ss:[bp+6]
	add ax,ax				;ax * 2
	mov di,ax
	
	mov al,ss:[bp+8]
	mov ah,ss:[bp+10]
	mov es:[bx+di],ax
	
	pop bx
	pop ax
	pop di
	pop es
	
	pop bp
	ret 8

codesg ends

datasg segment
	aa dw 0,0,0,0,0
datasg ends

stacksg segment
	db 0ffh dup (0)
stacksg ends

end start
