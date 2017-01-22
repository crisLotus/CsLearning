assume cs:codesg, ds:datasg, ss:stacksg

;_print_s_
;输出c类型字符串

codesg segment
start:	
	;init registor
	mov ax,datasg
	mov ds,ax	;ds:datasg
	mov ax,stacksg
	mov ss,ax	;ss:stacksg
	mov sp,0	;sp:
	
	;	row		4
	;	col		6
	;	segment	8	段
	;	point	10	偏移
	;	att		12	显示属性
	mov ax,2
	push ax
	mov ax,0
	push ax
	mov ax,datasg
	push ax
	mov ax,12
	push ax
	mov ax,12
	push ax
	call _print_s_
	
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

_print_s_:
	;类字符串'\0'

	;argc:
	;	row		4
	;	col		6
	;	segment	8	段
	;	point	10	偏移
	;	att		12	显示属性
	push bp
	mov bp,sp
	
	push bx 
	push ds
	push si
	
	mov bx,0
	mov ax,ss:[bp+8]
	mov ds,ax
	mov si,ss:[bp+10]
	
	_print_s_loop:
	mov ax,ss:[bp+12];att
	push ax
	mov ax,ds:[bx+si];字符
	push ax
	mov ax,ss:[bp+6];col
	add ax,bx
	push ax
	mov ax,ss:[bp+4];row
	push ax
	call _print_c_
	
	mov ax,ds:[bx]
	add bx,1
	cmp ax,0
	jne _print_s_loop
	
	pop si
	pop ds
	pop bx 
	
	pop bp
	ret 10
	
_print_s_n_:

	;字符串的一定长度

	;argc:
	; row
	; col
	; char*
	; count
	push bp
	
	mov bx,ss:[bp]
	
	pop bp
	ret 6
	
codesg ends

datasg segment
	db 'Hello World!',0
datasg ends

stacksg segment
	db 0ffffh dup (0)
stacksg ends

end start