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
	;si => di
	mov si,offset string_
	mov di,0
	
	mov cx,20
	main_loop:
	
	push cx
	mov cx,22
	string_loop:
	mov ax,line_1_color;att
	push ax
	mov ax,[si] ;char
	push ax
	mov ax,col;col
	push ax
	mov ax,row;row
	push ax
	call _print_c_
	
	mov ax,line_2_color;att
	push ax
	mov ax,[si];char
	push ax
	mov ax,col;col
	add ax,3
	push ax
	mov ax,row;row
	push ax
	call _print_c_
	
	mov ax,line_3_color;att
	push ax
	mov ax,[si];char
	push ax
	mov ax,col;col
	add ax,6
	push ax
	mov ax,row;row
	push ax
	call _print_c_
	
	add si,1
	add row,1
	add col,2
	
	loop string_loop
	pop cx
	mov si,offset string_
	mov row,0
	mov col,0
	
	mov dx,line_3_color
	mov ax,line_2_color
	mov line_3_color,ax
	mov ax,line_1_color
	mov line_2_color,ax
	mov line_1_color,dx
	
	call sleep_
	loop main_loop

	mov ax,4c00h
	int 21h

sleep_:
	push cx	
	mov cx,10h  ;注意：改变此cx值可改变延时的时间长短
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
	line_1_color 	dw 1
	line_2_color 	dw 2
	line_3_color 	dw 4
	string_ 		db'Happy Spring Festival!'
	row				dw 0
	col				dw 0
datasg ends

stacksg segment
	db 0ffffh dup (0)
stacksg ends

end start