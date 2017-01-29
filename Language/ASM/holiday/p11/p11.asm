assume cs:codesg, ds:datasg, ss:stacksg

;template

codesg segment
start:	
	;init registor
	mov ax,datasg
	mov ds,ax	;ds:datasg
	mov ax,stacksg
	mov ss,ax	;ss:stacksg
	mov sp,100h
	
	;your code
	call print_strings
	call print_tree

	mov ax,4c00h
	int 21h

print_strings:
	jmp print_strings_start
	s_col			dw 0	;0-79
	s_top_row		dw 0	;0-24
	s_bottom_row	dw 24	;24-0
	;mov ax,cs:s_row
	
	print_strings_start:
	
	push cx;start next_line_print_strings
	mov cx,25
	next_line_print_strings:
	mov bx,0;char index
	push cx	;start one_line_string_print
	mov cx,20;改成40后，出现清除next line的效果
	one_line_string_print:
	mov ax,2	;att
	push ax
	mov al,[ABCDE+bx]	;char
	mov ah,0
	push ax
	mov ax,cs:s_col	;col
	push ax
	mov ax,cs:s_top_row	;row
	push ax
	call _print_c_
	
	add bx,1	;next char
	add cs:s_col,2	;next col
	
	mov ax,2	;att
	push ax
	mov al,[ABCDE+bx]	;char
	mov ah,0
	push ax
	mov ax,cs:s_col	;col
	push ax
	mov ax,cs:s_bottom_row	;row
	push ax
	call _print_c_
	
	add bx,1	;next char
	add cs:s_col,2 ;next col
	loop one_line_string_print
	pop cx	;end one_line_string_print
	
	add cs:s_top_row,1
	sub cs:s_bottom_row,1
	mov cs:s_col,0
	
	call sleep_
	loop next_line_print_strings
	pop cx ;end next_line_print_strings
	
	ret
	
print_tree:
	jmp print_tree_start
	tree_row dw 0
	tree_col dw 0
	tree_style dw 4
	tree_char dw 1
	print_tree_start:
	
	mov cs:tree_row,0
	mov cs:tree_col,40
	
	push cx
	mov cx,7
	_tree_1:
	call change_style
	mov ax,cs:tree_style;att
	push ax
	mov ax,cs:tree_char;char
	push ax
	mov ax,cs:tree_col;col
	push ax
	mov ax,cs:tree_row;row
	push ax
	call _print_c_
	add cs:tree_row,1
	sub cs:tree_col,2
	call sleep_
	loop _tree_1
	pop cx
	
	push cx
	mov cx,6
	_tree_2:
	call change_style
	mov ax,cs:tree_style;att
	push ax
	mov ax,cs:tree_char;char
	push ax
	mov ax,cs:tree_col;col
	push ax
	mov ax,cs:tree_row;row
	push ax
	call _print_c_
	add cs:tree_col,2
	call sleep_
	loop _tree_2
	pop cx
	
	push cx
	mov cx,10
	_tree_3:
	call change_style
	mov ax,cs:tree_style;att
	push ax
	mov ax,cs:tree_char;char
	push ax
	mov ax,cs:tree_col;col
	push ax
	mov ax,cs:tree_row;row
	push ax
	call _print_c_
	add cs:tree_row,1
	sub cs:tree_col,2
	call sleep_
	loop _tree_3
	pop cx
	
	push cx
	mov cx,10
	_tree_4:
	call change_style
	mov ax,cs:tree_style;att
	push ax
	mov ax,cs:tree_char;char
	push ax
	mov ax,cs:tree_col;col
	push ax
	mov ax,cs:tree_row;row
	push ax
	call _print_c_
	add cs:tree_col,2
	call sleep_
	loop _tree_4
	pop cx
	
	push cx
	mov cx,6
	_tree_5:
	call change_style
	mov ax,cs:tree_style;att
	push ax
	mov ax,cs:tree_char;char
	push ax
	mov ax,cs:tree_col;col
	push ax
	mov ax,cs:tree_row;row
	push ax
	call _print_c_
	add cs:tree_row,1
	call sleep_
	loop _tree_5
	pop cx
	
	push cx
	mov cx,3
	_tree_6:
	call change_style
	mov ax,cs:tree_style;att
	push ax
	mov ax,cs:tree_char;char
	push ax
	mov ax,cs:tree_col;col
	push ax
	mov ax,cs:tree_row;row
	push ax
	call _print_c_
	add cs:tree_col,2
	call sleep_
	loop _tree_6
	pop cx
	
	push cx
	mov cx,6
	_tree_7:
	call change_style
	mov ax,cs:tree_style;att
	push ax
	mov ax,cs:tree_char;char
	push ax
	mov ax,cs:tree_col;col
	push ax
	mov ax,cs:tree_row;row
	push ax
	call _print_c_
	sub cs:tree_row,1
	call sleep_
	loop _tree_7
	pop cx
	
	push cx
	mov cx,10
	_tree_8:
	call change_style
	mov ax,cs:tree_style;att
	push ax
	mov ax,cs:tree_char;char
	push ax
	mov ax,cs:tree_col;col
	push ax
	mov ax,cs:tree_row;row
	push ax
	call _print_c_
	add cs:tree_col,2
	call sleep_
	loop _tree_8
	pop cx
	
	push cx
	mov cx,10
	_tree_9:
	call change_style
	mov ax,cs:tree_style;att
	push ax
	mov ax,cs:tree_char;char
	push ax
	mov ax,cs:tree_col;col
	push ax
	mov ax,cs:tree_row;row
	push ax
	call _print_c_
	sub cs:tree_row,1
	sub cs:tree_col,2
	call sleep_
	loop _tree_9
	pop cx
	
	push cx
	mov cx,6
	_tree_10:
	call change_style
	mov ax,cs:tree_style;att
	push ax
	mov ax,cs:tree_char;char
	push ax
	mov ax,cs:tree_col;col
	push ax
	mov ax,cs:tree_row;row
	push ax
	call _print_c_
	add cs:tree_col,2
	call sleep_
	loop _tree_10
	pop cx
	
	push cx
	mov cx,8
	_tree_11:
	call change_style
	mov ax,cs:tree_style;att
	push ax
	mov ax,cs:tree_char;char
	push ax
	mov ax,cs:tree_col;col
	push ax
	mov ax,cs:tree_row;row
	push ax
	call _print_c_
	sub cs:tree_row,1
	sub cs:tree_col,2
	call sleep_
	loop _tree_11
	pop cx
	
	ret
	
change_style:
	add cs:tree_style,1
	ret

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

	ABCDE db 'ABCDEFGHIJKLMNOPQRSTUVWXYZ123456789ABCDE'
	
	
datasg ends

stacksg segment
	db 0ffh dup (0)
stacksg ends

end start