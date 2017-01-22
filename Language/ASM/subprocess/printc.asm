assume cs:codesg, ds:datasg, ss:stacksg

;_print_c_ 输出某个字符到屏幕

codesg segment
start:	
	;init registor
	mov ax,datasg
	mov ds,ax	;ds:datasg
	mov ax,stacksg
	mov ss,ax	;ss:stacksg
	mov sp,0	;sp:
	
	;test _print_c_
	
	mov ax,2;att
	push ax
	mov ax,'a'
	push ax
	mov ax,15;col
	push ax
	mov ax,20;row
	push ax
	call _print_c_
	
	mov ax,2;att
	push ax
	mov ax,'b'
	push ax
	mov ax,0;col
	push ax
	mov ax,0;row
	push ax
	call _print_c_
	
	mov ax,2;att
	push ax
	mov ax,'c'
	push ax
	mov ax,79;col
	push ax
	mov ax,24;row
	push ax
	call _print_c_
	
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
	db 'a','b','c','d',0
datasg ends

stacksg segment
	db 0ffffh dup (0)
stacksg ends

end start