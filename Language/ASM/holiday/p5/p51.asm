assume cs:codesg, ds:data, ss:stacksg

codesg segment
start:	
	;init registor
	;mov ax,codesg
	;mov cs,ax
	mov ax,data
	mov ds,ax	;ds:datasg
	mov ax,stacksg
	mov ss,ax	;ss:stacksg
	mov sp,0	;sp:
	
	
	;梳理字符串
	;if(ax>=41h and ax<=5ah or ax==' ' or ax=='!'){
	;	[di] <= [si]
	;}
	mov si,0
	mov di,0
	
	is_alpha:
	mov ah,0
	mov al,ds:[si]
	or al,00100000b
	cmp ax,'?'
	je is_alpha_end
	;ax < 61h j e1
	cmp ax,61h
	jb e1
	;ax <= 7ah j e2
	cmp ax,7ah
	jbe e2
	e1:
	;ax == ' ' j e2
	cmp ax,' '
	je e2
	;ax != '!' j e3
	cmp ax,'!'
	jne e3
	e2:
		;ds:[di] <= ds:[si]
		mov al,ds:[si]
		mov ds:[di],al
		add di,1
	e3:
		add si,1
	cmp ax,'?'
	jne is_alpha
	is_alpha_end:
	
	;首字母大写，其他小写
	mov cx,16
	mov si,0
	mov ax,0
	mov dx,1;flag = true
	main_format_str:
	mov al,ds:[si]
	cmp ax,'!'
	jne start_change
		mov dx,1
		jmp if_end
	start_change:
	cmp dx,1
	jne else_if
		and al,11011111b; 变大
		mov dx,0
		jmp if_end
	else_if:
		or al,00100000b;变小
	if_end:
	mov ds:[si],al
	add si,1
	
	cmp ax,'?'
	jne main_format_str
	;loop main_format_str
	
	;	row		4
	;	col		6
	;	segment	8	段
	;	point	10	偏移
	;	att		12	显示属性
	mov ax,2
	push ax
	mov ax,0
	push ax
	mov ax,data
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
	cmp ax,'?'
	jne _print_s_loop
	
	pop si
	pop ds
	pop bx 
	
	pop bp
	ret 10

codesg ends

data segment
	db 'h12E332l@L#O*&^!88nI@cE$% %$T1O m33E44E55t y77O88u!()'
	db '?'
data ends

stacksg segment
	db 0ffffh dup (0)
stacksg ends

end start