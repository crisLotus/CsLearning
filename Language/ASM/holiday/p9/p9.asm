assume cs:codesg, ds:datasg, ss:stacksg

;template

codesg segment
start:	
	;init registor
	mov ax,datasg
	mov ds,ax	;ds:datasg
	mov ax,stacksg
	mov ss,ax	;ss:stacksg
	mov sp,0	;sp:

	;your code
	mov cx,128
	main_loop:
	
	mov ax,2;att
	push ax
	mov ax,char_
	push ax
	mov ax,p_col;col
	push ax
	mov ax,p_row;row
	push ax
	call _print_c_
	
	add word ptr p_row,1;下一行
	add word ptr char_,1;下个字符
	
	mov ax,char_
	add ax,1
	div c_20
	cmp ah,0
	jne bu_huanhang
	sub p_col,5;左移5行
	mov p_row,5;恢复初始行5
	bu_huanhang:
	
	call sleep_
	
	loop main_loop

	mov ax,4c00h
	int 21h
	
sleep_:
	push cx	
	mov cx,08h  ;注意：改变此cx值可改变延时的时间长短
	s0:push cx
	mov cx,0ffffh
	s1:sub dx,dx
	loop s1
	pop cx
	loop s0
	pop cx
	ret
	
_print_c_:
	;argc:
	;	row		4	行 0-24
	;	col		6	列 0-79
	;	char	8
	;	att		10	显示属性
	
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
	char_ dw 0
	p_row dw 5
	p_col dw 75
	c_20 db 20
datasg ends

stacksg segment
	db 0ffffh dup (0)
stacksg ends

end start