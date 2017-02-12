assume cs:codesg, ds:datasg, ss:stacksg

;

codesg segment
start:	
	;init registor
	mov ax,datasg
	mov ds,ax	;ds:datasg
	mov ax,stacksg
	mov ss,ax	;ss:stacksg
	mov sp,100h	;sp:

	;your code
	jmp main
	
	row dw 0
	col dw 0
	
	main:
	
	mov cx,25
	row_:
	
	push cx
	mov cx,80
	col_:
	mov ax,40h;att
	push ax
	mov ax,0
	push ax
	mov ax,cs:col;col
	push ax
	mov ax,cs:row;row
	push ax
	call _print_c_
	add cs:col,1
	loop col_
	pop cx
	loop row_
	
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
	aa dw 0,0,0,0,0
datasg ends

stacksg segment
	db 0ffh dup (0)
stacksg ends

end start