assume cs:codesg, ds:datasg, ss:stacksg

;p8 笑脸阶梯走

codesg segment
start:	
	;init registor
	mov ax,datasg
	mov ds,ax	;ds:datasg
	mov ax,stacksg
	mov ss,ax	;ss:stacksg
	mov sp,0	;sp:

	;drow three line
	mov word ptr dot_row,20
	mov word ptr dot_col,0
	
	mov cx,3
	drow_three_line:
	push cx
	
	mov cx,20
	one_line_point:
	mov ax,2;att green
	push ax
	mov ax,'.'
	push ax
	mov ax,dot_col;col
	push ax
	mov ax,dot_row;row
	push ax
	call _print_c_
	add dot_col,1
	loop one_line_point
	
	pop cx
	sub dot_row,5
	loop drow_three_line
	
	;move the pict on lines
	mov word ptr dot_row,19
	mov word ptr dot_col,0

	mov cx,3
	three_line_pic:
		
	push cx
	mov cx,20
	pic_one_line:
	mov ax,2;att green
	push ax
	mov ax,1;图?
	push ax
	mov ax,dot_col;col
	push ax
	mov ax,dot_row;row
	push ax
	call _print_c_
	
	;clean pre
	mov ax,0;att green
	push ax
	mov ax,0;
	push ax
	mov ax,dot_col
	sub ax,1 ;col
	push ax
	mov ax,dot_row;row
	push ax
	call _print_c_
	
	push cx
	mov cx,008h  ;注意：改变此cx值可改变延时的时间长短
	s0:push cx
	mov cx,0ffffh
	s1:sub dx,dx
	loop s1
	pop cx
	loop s0
	pop cx
	
	add dot_col,1
	loop pic_one_line
	pop cx
	
	;clean pre line last pic
	mov ax,0;att green
	push ax
	mov ax,0;
	push ax
	mov ax,dot_col
	sub ax,1 ;col
	push ax
	mov ax,dot_row;row
	push ax
	call _print_c_
	
	sub dot_row,5
	loop three_line_pic
	
	
	mov ax,4c00h
	int 21h

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
	dot_row dw 0 ;dot and pi当前位置
	dot_col dw 0
datasg ends

stacksg segment
	db 0ffffh dup (0)
stacksg ends

end start