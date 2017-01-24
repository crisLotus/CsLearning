assume cs:codesg, ds:datasg, ss:stacksg

;test 输出字

codesg segment
start:	
	;init registor
	mov ax,datasg
	mov ds,ax	;ds:datasg
	mov ax,stacksg
	mov ss,ax	;ss:stacksg
	mov sp,0	;sp:0
	;your code
	mov bx,5;首行
	mov si,0;字符指针
	mov word ptr word_2,4
	mov di,word_2;首列
	call main_print_loop
	
	mov word ptr word_2,21
	mov di,word_2;首列
	mov bx,5
	call main_print_loop
	
	mov ax,4c00h
	int 21h

main_print_loop:

	mov cx,16
	main_loop_start:	
		mov ax,[si]

		mov saved_data,ax
		mov dx,saved_data
		mov al,dh
		mov ah,dl
		push ax
		call _print_one_line
	
		add si,2
		add bx,1;换行
		mov di,word_2
	loop main_loop_start
	ret


_print_one_line:
	;data 16b	4
	;init
	;return None
	push bp
	mov bp,sp
	push cx
	
	mov ax,ss:[bp+4]
	mov cx,16
	main_loop:
		mov dx,0
		div t_2
		push dx
	loop main_loop

	mov dx,di;保存列号	
	mov cx,16
	_print_main_loop:
		pop ax
		cmp ax,1
		jne _print_0_end
			mov ax,2;att
			push ax
			mov ax,3;char
			push ax
			mov ax,di;列
			push ax
			push bx;行号
			call _print_c_
		_print_0_end:
		add di,1
	loop _print_main_loop
	mov di,dx;回复列号
	pop cx
	pop bp
	ret 2

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
	;中
	DB 01H,00H,01H,00H,01H,00H,01H,00H,3FH,0F8H,21H,08H,21H,08H,21H,08H
	DB 21H,08H,21H,08H,3FH,0F8H,21H,08H,01H,00H,01H,00H,01H,00H,01H,00H
	
	;华
	DB  08H,80H,08H,88H,10H,90H,30H,0E0H,51H,80H,96H,84H,10H,84H,10H,7CH
	DB  11H,00H,01H,00H,0FFH,0FEH,01H,00H,01H,00H,01H,00H,01H,00H,01H,00H
	
	t_2 dw 2
	word_2 dw 0;存第二个字的列数
	saved_data dw 0
datasg ends

stacksg segment
	db 0ffffh dup (0)
stacksg ends

end start