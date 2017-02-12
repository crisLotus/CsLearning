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
	
	;画地图
	call print_map_fun_
	
	call mov_python
		
	mov ax,4c00h
	int 21h
	
mov_python:
	jmp mov_python_main_code
	
	m_p_row dw 14
	m_p_col dw 79
	m_p_dire dw 0 ;左0 下1 右2 上3
	
	mov_python_main_code:
	push cx
	
	mov_python_loop:	;start mov_python_loop
	
	mov ax,cs:m_p_col
	pop ax
	mov ax,cs:m_p_row
	pop ax
	call _get_screen_mem
	
	cmp ax,2000h	;是否为终点
	je end_mov_python
	
	;...
	call move_straight
	call sleep_
	call move_straight
	call sleep_
	call turn_left
	call sleep_
	call move_straight
	call sleep_
	call turn_right
	call sleep_
	call turn_right
	call sleep_
	call move_straight
	call sleep_
	call move_straight
	call sleep_
	call turn_left
	
	;call left_is_none
	;cmp ax,1
	;jne left_is_not_none_mov_python
	;call turn_left
	left_is_not_none_mov_python:
	call sleep_
	
	jmp mov_python_loop
	
	end_mov_python:
	pop cx
	ret

left_is_none:
	mov ax,cs:m_p_dire
	cmp ax,0
	jne left_is_none_not_left
		mov ax,cs:m_p_col
		pop ax
		mov ax,cs:m_p_row
		add ax,1
		cmp ax,80
		je left_is_not_none
		pop ax
		call _get_screen_mem
		cmp ax,0
		je left_is_none_
		je left_is_not_none
	left_is_none_not_left:
	
	mov ax,cs:m_p_dire
	cmp ax,1
	jne left_is_none_not_down
		mov ax,cs:m_p_col
		add ax,1
		cmp ax,80
		jae left_is_not_none
		pop ax
		mov ax,cs:m_p_row
		pop ax
		call _get_screen_mem
		cmp ax,0
		je left_is_none_
		je left_is_not_none
	
	left_is_none_not_down:
	
	mov ax,cs:m_p_dire
	cmp ax,2
	jne left_is_none_not_right
		mov ax,cs:m_p_col
		pop ax
		mov ax,cs:m_p_row
		sub ax,1
		cmp ax,80
		jae left_is_not_none
		pop ax
		call _get_screen_mem
		cmp ax,0
		je left_is_none_
		je left_is_not_none
		
	left_is_none_not_right:
	
	mov ax,cs:m_p_dire
	cmp ax,3
	jne left_is_none_not_up
		mov ax,cs:m_p_col
		sub ax,1
		cmp ax,80
		jae left_is_not_none
		pop ax
		mov ax,cs:m_p_row
		pop ax
		call _get_screen_mem
		cmp ax,0
		je left_is_none_
		je left_is_not_none

	left_is_none_not_up:
	left_is_none_:
		mov ax,1
		ret
	left_is_not_none:
		mov ax,0
		ret

turn_left:
	push ax
	mov ax,cs:m_p_dire
	cmp ax,0
	jne turn_left_not_left
		mov cs:m_p_dire,1
		
		mov ax,2;att
		push ax
		mov ax,'v'
		push ax
		mov ax,cs:m_p_col;col
		push ax
		mov ax,cs:m_p_row;row
		push ax
		call _print_c_
		call move_straight
	turn_left_not_left:
	
	cmp ax,1
	jne turn_left_not_down
		mov cs:m_p_dire,2
		
		mov ax,2;att
		push ax
		mov ax,'>'
		push ax
		mov ax,cs:m_p_col;col
		push ax
		mov ax,cs:m_p_row;row
		push ax
		call _print_c_
		call move_straight
	turn_left_not_down:
	
	cmp ax,2
	jne turn_left_not_right
		mov cs:m_p_dire,3
		
		mov ax,2;att
		push ax
		mov ax,'^'
		push ax
		mov ax,cs:m_p_col;col
		push ax
		mov ax,cs:m_p_row;row
		push ax
		call _print_c_
		call move_straight
	turn_left_not_right:
	
	cmp ax,3
	jne turn_left_not_up
		mov cs:m_p_dire,0
		mov ax,2;att
		push ax
		mov ax,'<'
		push ax
		mov ax,cs:m_p_col;col
		push ax
		mov ax,cs:m_p_row;row
		push ax
		call _print_c_
		call move_straight
	turn_left_not_up:
	pop ax
	ret

turn_right:
	push ax
	mov ax,cs:m_p_dire
	cmp ax,0
	jne turn_right_not_left
		mov cs:m_p_dire,3
		
		mov ax,2;att
		push ax
		mov ax,'^'
		push ax
		mov ax,cs:m_p_col;col
		push ax
		mov ax,cs:m_p_row;row
		push ax
		call _print_c_
		call move_straight
	turn_right_not_left:
	
	cmp ax,1
	jne turn_right_not_down
		mov cs:m_p_dire,0
		
		mov ax,2;att
		push ax
		mov ax,'<'
		push ax
		mov ax,cs:m_p_col;col
		push ax
		mov ax,cs:m_p_row;row
		push ax
		call _print_c_
		call move_straight
	turn_right_not_down:
	
	cmp ax,2
	jne turn_right_not_right
		mov cs:m_p_dire,1
		
		mov ax,2;att
		push ax
		mov ax,'v'
		push ax
		mov ax,cs:m_p_col;col
		push ax
		mov ax,cs:m_p_row;row
		push ax
		call _print_c_
		call move_straight
	turn_right_not_right:
	
	cmp ax,3
	jne turn_right_not_up
		mov cs:m_p_dire,2
		mov ax,2;att
		push ax
		mov ax,'>'
		push ax
		mov ax,cs:m_p_col;col
		push ax
		mov ax,cs:m_p_row;row
		push ax
		call _print_c_
		call move_straight
	turn_right_not_up:
	pop ax
	ret

move_straight:
	push ax
	mov ax,cs:m_p_dire
	cmp ax,0
	jne move_straight_not_left
		sub cs:m_p_col,1
		
		mov ax,2;att
		push ax
		mov ax,'<'
		push ax
		mov ax,cs:m_p_col;col
		push ax
		mov ax,cs:m_p_row;row
		push ax
		call _print_c_
	move_straight_not_left:
	
	cmp ax,1
	jne move_straight_not_down
		add cs:m_p_row,1
		
		mov ax,2;att
		push ax
		mov ax,'v'
		push ax
		mov ax,cs:m_p_col;col
		push ax
		mov ax,cs:m_p_row;row
		push ax
		call _print_c_
	
	move_straight_not_down:
	
	cmp ax,2
	jne move_straight_not_right
		add cs:m_p_col,1
		
		mov ax,2;att
		push ax
		mov ax,'>'
		push ax
		mov ax,cs:m_p_col;col
		push ax
		mov ax,cs:m_p_row;row
		push ax
		call _print_c_
	move_straight_not_right:
	
	cmp ax,3
	jne move_straight_not_up
		sub cs:m_p_row,1
		mov ax,2;att
		push ax
		mov ax,'^'
		push ax
		mov ax,cs:m_p_col;col
		push ax
		mov ax,cs:m_p_row;row
		push ax
		call _print_c_
	move_straight_not_up:
	pop ax
	ret

print_map_fun_:
	;画地图
	push ax
	push bx
	push cx
	push es
	
	mov ax,0b800h
	mov es,ax
	mov bx,0
	mov cx,80*25
	print_map_fun_loop:
		mov ax,screen[bx]
		mov es:[bx], ax
		add bx,2
	loop print_map_fun_loop
	
	pop es
	pop cx
	pop bx
	pop ax
	ret

_get_screen_mem:
	;argc:
	;	row		4	行 0-24
	;	col		6	列 0-79
	;return ax:内存中的数据
	
	;Usage:
	;	mov ax,col
	;	pop ax
	;	mov ax,row
	;	pop ax
	;	call _get_screen_mem
	push bp
	mov bp,sp
	push bx
	push di
	push es
	
	mov ax,0b800h
	mov es,ax
	
	mov ax,0a0h
	mul word ptr ss:[bp+4]	;row * 0b800h
	mov bx, ax
	
	mov ax,ss:[bp+6]
	add ax,ax				;col * 2
	mov di,ax
	mov ax,es:[bx+di]
	
	pop es
	pop di
	pop bx
	pop bp
	ret 4

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

sleep_:
	push cx	
	mov cx,010h  ;注意：改变此cx值可改变延时的时间长短
	s0:push cx
	mov cx,0ffffh
	s1:sub dx,dx
	loop s1
	pop cx
	loop s0
	pop cx
	ret


codesg ends

datasg segment
	screen dw 4000h,4000h,4000h,4000h,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
dw 0,0,0,0,0,0,0,4000h,4000h,4000h,4000h,4000h,4000h,4000h,4000h,4000h,4000h,4000h,4000h,4000h
dw 4000h,4000h,4000h,4000h,4000h,4000h,4000h,4000h,4000h,4000h,4000h,4000h,0,0,0,0,0,0,0,0
dw 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,4000h,4000h,4000h,4000h,4000h
dw 4000h,4000h,4000h,4000h,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
dw 0,0,0,0,0,0,0,4000h,4000h,4000h,4000h,4000h,4000h,4000h,4000h,4000h,4000h,4000h,4000h,4000h
dw 4000h,4000h,4000h,4000h,4000h,4000h,4000h,4000h,4000h,4000h,4000h,4000h,0,0,0,0,0,0,0,0
dw 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,4000h,4000h,4000h,4000h,4000h
dw 4000h,4000h,4000h,4000h,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
dw 0,0,0,0,0,0,0,4000h,4000h,4000h,4000h,4000h,4000h,4000h,4000h,4000h,4000h,4000h,4000h,4000h
dw 4000h,4000h,4000h,4000h,4000h,4000h,4000h,4000h,4000h,4000h,4000h,4000h,0,0,0,0,0,0,0,0
dw 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,4000h,4000h,4000h,4000h,4000h
dw 4000h,4000h,4000h,4000h,0,0,0,4000h,4000h,4000h,4000h,4000h,4000h,4000h,4000h,4000h,4000h,4000h,4000h,4000h
dw 4000h,4000h,4000h,4000h,4000h,4000h,4000h,4000h,4000h,4000h,4000h,4000h,4000h,4000h,4000h,4000h,4000h,4000h,4000h,4000h
dw 4000h,4000h,4000h,4000h,4000h,4000h,4000h,4000h,4000h,4000h,4000h,4000h,4000h,4000h,4000h,4000h,4000h,4000h,4000h,4000h
dw 4000h,4000h,4000h,4000h,4000h,4000h,4000h,4000h,4000h,4000h,4000h,4000h,0,0,0,4000h,4000h,4000h,4000h,4000h
dw 4000h,4000h,4000h,4000h,0,0,0,4000h,4000h,4000h,4000h,4000h,4000h,4000h,4000h,4000h,4000h,4000h,4000h,4000h
dw 4000h,4000h,4000h,4000h,4000h,4000h,4000h,4000h,4000h,4000h,4000h,4000h,4000h,4000h,4000h,4000h,4000h,4000h,4000h,4000h
dw 4000h,4000h,4000h,4000h,4000h,4000h,4000h,4000h,4000h,4000h,4000h,4000h,4000h,4000h,4000h,4000h,4000h,4000h,4000h,4000h
dw 4000h,4000h,4000h,4000h,4000h,4000h,4000h,4000h,4000h,4000h,4000h,4000h,0,0,0,4000h,4000h,4000h,4000h,4000h
dw 4000h,4000h,4000h,4000h,0,0,0,4000h,4000h,4000h,4000h,4000h,4000h,4000h,4000h,4000h,4000h,4000h,4000h,4000h
dw 4000h,4000h,4000h,4000h,4000h,4000h,4000h,4000h,4000h,4000h,4000h,4000h,4000h,4000h,4000h,4000h,4000h,4000h,4000h,4000h
dw 4000h,4000h,4000h,4000h,4000h,4000h,4000h,4000h,4000h,4000h,4000h,4000h,4000h,4000h,4000h,4000h,4000h,4000h,4000h,4000h
dw 4000h,4000h,4000h,4000h,4000h,4000h,4000h,4000h,4000h,4000h,4000h,4000h,0,0,0,4000h,4000h,4000h,4000h,4000h
dw 4000h,4000h,4000h,4000h,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
dw 0,0,0,0,0,0,0,0,0,0,4000h,4000h,4000h,4000h,4000h,4000h,4000h,4000h,4000h,4000h
dw 4000h,4000h,4000h,4000h,4000h,4000h,4000h,4000h,4000h,0,0,0,0,0,0,0,0,0,0,0
dw 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,4000h,4000h,4000h,4000h,4000h
dw 4000h,4000h,4000h,4000h,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
dw 0,0,0,0,0,0,0,0,0,0,4000h,4000h,4000h,4000h,4000h,4000h,4000h,4000h,4000h,4000h
dw 4000h,4000h,4000h,4000h,4000h,4000h,4000h,4000h,4000h,0,0,0,0,0,0,0,0,0,0,0
dw 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,4000h,4000h,4000h,4000h,4000h
dw 0,0,4000h,4000h,4000h,4000h,4000h,4000h,4000h,4000h,4000h,4000h,4000h,4000h,4000h,4000h,4000h,4000h,4000h,4000h
dw 4000h,4000h,4000h,4000h,4000h,4000h,4000h,0,0,0,0,0,0,0,0,0,0,0,0,0
dw 0,0,0,0,0,0,0,0,0,0,0,0,4000h,4000h,4000h,4000h,4000h,4000h,4000h,4000h
dw 4000h,4000h,4000h,4000h,4000h,4000h,4000h,4000h,4000h,4000h,4000h,4000h,4000h,4000h,4000h,4000h,4000h,4000h,4000h,4000h
dw 0,0,4000h,4000h,4000h,4000h,4000h,4000h,4000h,4000h,4000h,4000h,4000h,4000h,4000h,4000h,4000h,4000h,4000h,4000h
dw 4000h,4000h,4000h,4000h,4000h,4000h,4000h,0,0,0,0,0,0,0,0,0,0,0,0,0
dw 0,0,0,0,0,0,0,0,0,0,0,0,4000h,4000h,4000h,4000h,4000h,4000h,4000h,4000h
dw 4000h,4000h,4000h,4000h,4000h,4000h,4000h,4000h,4000h,4000h,4000h,0,0,0,0,0,0,0,0,0
dw 0,0,4000h,4000h,4000h,4000h,4000h,4000h,4000h,4000h,4000h,4000h,4000h,4000h,4000h,4000h,4000h,4000h,4000h,4000h
dw 4000h,4000h,4000h,4000h,4000h,4000h,4000h,4000h,4000h,4000h,4000h,4000h,0,0,0,0,0,0,0,0
dw 0,0,0,0,0,0,0,4000h,4000h,4000h,4000h,4000h,4000h,4000h,4000h,4000h,4000h,4000h,4000h,4000h
dw 4000h,4000h,4000h,4000h,4000h,4000h,4000h,4000h,4000h,4000h,0,0,0,0,0,0,0,0,0,2000h
dw 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
dw 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
dw 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
dw 0,0,0,0,0,0,0,0,0,0,0,4000h,4000h,4000h,4000h,4000h,4000h,4000h,4000h,4000h
dw 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
dw 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
dw 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
dw 0,0,0,0,0,0,0,0,0,0,0,4000h,4000h,4000h,4000h,4000h,4000h,4000h,4000h,4000h
dw 0,0,4000h,4000h,4000h,4000h,4000h,4000h,4000h,4000h,4000h,4000h,4000h,4000h,4000h,4000h,4000h,4000h,4000h,4000h
dw 4000h,4000h,4000h,4000h,4000h,4000h,4000h,4000h,4000h,4000h,4000h,4000h,4000h,4000h,4000h,4000h,4000h,0,0,0
dw 0,0,0,0,4000h,4000h,4000h,4000h,4000h,4000h,4000h,4000h,4000h,4000h,4000h,4000h,4000h,4000h,4000h,4000h
dw 4000h,4000h,4000h,4000h,4000h,4000h,4000h,4000h,4000h,4000h,0,0,0,0,0,0,0,0,0,0
dw 0,0,4000h,4000h,4000h,4000h,4000h,4000h,4000h,4000h,4000h,4000h,4000h,4000h,4000h,4000h,4000h,4000h,4000h,4000h
dw 4000h,4000h,4000h,4000h,4000h,4000h,4000h,4000h,4000h,4000h,4000h,4000h,4000h,4000h,4000h,4000h,4000h,0,0,0
dw 0,0,0,0,4000h,4000h,4000h,4000h,4000h,4000h,4000h,4000h,4000h,4000h,4000h,4000h,4000h,4000h,4000h,4000h
dw 4000h,4000h,4000h,4000h,4000h,4000h,4000h,4000h,4000h,4000h,4000h,0,0,0,0,0,0,0,0,0
dw 0,0,4000h,4000h,4000h,4000h,4000h,4000h,4000h,4000h,4000h,4000h,4000h,4000h,4000h,4000h,4000h,4000h,4000h,4000h
dw 4000h,4000h,4000h,4000h,4000h,4000h,4000h,4000h,4000h,4000h,4000h,4000h,4000h,4000h,4000h,4000h,0,0,0,0
dw 4000h,0,0,0,0,4000h,4000h,4000h,4000h,4000h,4000h,4000h,4000h,4000h,4000h,4000h,4000h,4000h,4000h,4000h
dw 4000h,4000h,4000h,4000h,4000h,4000h,4000h,4000h,4000h,4000h,4000h,4000h,4000h,4000h,4000h,4000h,4000h,4000h,4000h,4000h
dw 4000h,4000h,4000h,4000h,4000h,4000h,4000h,4000h,4000h,4000h,4000h,0,0,0,0,0,0,0,0,0
dw 0,0,4000h,4000h,4000h,4000h,4000h,4000h,4000h,4000h,4000h,4000h,4000h,4000h,4000h,0,0,0,0,4000h
dw 4000h,4000h,0,0,0,0,4000h,4000h,4000h,4000h,4000h,4000h,4000h,4000h,4000h,4000h,4000h,4000h,4000h,0
dw 0,0,0,0,0,0,0,0,0,0,4000h,4000h,4000h,4000h,4000h,4000h,4000h,4000h,4000h,4000h
dw 4000h,4000h,4000h,4000h,4000h,4000h,4000h,4000h,4000h,4000h,4000h,0,0,0,0,0,0,0,0,0
dw 0,0,4000h,4000h,4000h,4000h,4000h,4000h,4000h,4000h,4000h,4000h,4000h,4000h,0,0,0,0,4000h,4000h
dw 4000h,4000h,4000h,0,0,0,0,4000h,4000h,4000h,4000h,4000h,4000h,4000h,4000h,4000h,4000h,4000h,4000h,0
dw 0,0,0,0,0,0,0,0,0,0,4000h,4000h,4000h,4000h,4000h,4000h,4000h,4000h,4000h,4000h
dw 4000h,4000h,4000h,4000h,4000h,4000h,4000h,4000h,4000h,4000h,4000h,0,0,4000h,4000h,4000h,4000h,4000h,4000h,4000h
dw 0,0,4000h,4000h,4000h,4000h,4000h,4000h,4000h,4000h,4000h,4000h,4000h,0,0,0,0,4000h,4000h,4000h
dw 4000h,4000h,4000h,4000h,0,0,0,0,4000h,4000h,4000h,4000h,4000h,4000h,4000h,4000h,4000h,4000h,4000h,0
dw 0,4000h,4000h,4000h,4000h,4000h,4000h,4000h,0,0,4000h,4000h,4000h,4000h,4000h,4000h,4000h,4000h,4000h,4000h
dw 4000h,4000h,4000h,4000h,4000h,4000h,4000h,4000h,4000h,4000h,4000h,0,0,4000h,4000h,4000h,4000h,4000h,4000h,4000h
dw 0,0,4000h,4000h,4000h,4000h,4000h,4000h,4000h,4000h,4000h,0,0,0,0,4000h,4000h,4000h,4000h,4000h
dw 4000h,4000h,4000h,4000h,4000h,0,0,0,0,4000h,4000h,4000h,4000h,4000h,4000h,4000h,4000h,4000h,4000h,0
dw 0,4000h,4000h,4000h,4000h,4000h,4000h,4000h,0,0,4000h,4000h,4000h,4000h,4000h,4000h,4000h,4000h,4000h,4000h
dw 4000h,4000h,4000h,4000h,4000h,4000h,4000h,4000h,4000h,4000h,4000h,0,0,4000h,4000h,4000h,4000h,4000h,4000h,4000h
dw 0,0,4000h,4000h,4000h,4000h,4000h,4000h,4000h,4000h,0,0,0,0,4000h,4000h,4000h,4000h,4000h,4000h
dw 4000h,4000h,4000h,4000h,4000h,4000h,0,0,0,0,4000h,4000h,4000h,4000h,4000h,4000h,4000h,4000h,4000h,0
dw 0,4000h,4000h,4000h,4000h,4000h,4000h,4000h,0,0,4000h,4000h,4000h,4000h,4000h,4000h,4000h,4000h,4000h,4000h
dw 4000h,4000h,4000h,4000h,4000h,4000h,4000h,4000h,4000h,4000h,4000h,0,0,4000h,4000h,4000h,4000h,4000h,4000h,4000h
dw 0,0,0,0,0,0,0,0,0,0,0,0,0,0,4000h,4000h,4000h,4000h,4000h,4000h
dw 4000h,4000h,4000h,4000h,4000h,4000h,4000h,0,0,0,0,0,0,0,0,0,0,0,0,0
dw 0,4000h,4000h,4000h,4000h,4000h,4000h,4000h,0,0,4000h,4000h,4000h,4000h,4000h,4000h,4000h,4000h,4000h,4000h
dw 4000h,4000h,4000h,4000h,4000h,4000h,4000h,4000h,4000h,4000h,4000h,0,0,4000h,4000h,4000h,4000h,4000h,4000h,4000h
dw 0,0,0,0,0,0,0,0,0,0,0,0,0,0,4000h,4000h,4000h,4000h,4000h,4000h
dw 4000h,4000h,4000h,4000h,4000h,4000h,4000h,0,0,0,0,0,0,0,0,0,0,0,0,0
dw 0,4000h,4000h,4000h,4000h,4000h,4000h,4000h,0,0,4000h,4000h,4000h,4000h,4000h,4000h,4000h,4000h,4000h,4000h
dw 0,0,0,0,0,0,0,0,0,0,0,0,0,4000h,4000h,4000h,4000h,4000h,4000h,4000h
dw 4000h,4000h,4000h,4000h,4000h,4000h,4000h,4000h,4000h,4000h,4000h,4000h,4000h,4000h,4000h,4000h,4000h,4000h,4000h,4000h
dw 4000h,4000h,4000h,4000h,4000h,4000h,4000h,4000h,4000h,4000h,4000h,4000h,4000h,4000h,4000h,4000h,4000h,4000h,4000h,4000h
dw 4000h,4000h,4000h,4000h,4000h,4000h,4000h,4000h,0,0,0,0,0,0,0,0,0,0,0,0
dw 0,0,0,0,0,0,0,0,0,0,0,0,0,4000h,4000h,4000h,4000h,4000h,4000h,4000h
dw 4000h,4000h,4000h,4000h,4000h,4000h,4000h,4000h,4000h,4000h,4000h,4000h,4000h,4000h,4000h,4000h,4000h,4000h,4000h,4000h
dw 4000h,4000h,4000h,4000h,4000h,4000h,4000h,4000h,4000h,4000h,4000h,4000h,4000h,4000h,4000h,4000h,4000h,4000h,4000h,4000h
dw 4000h,4000h,4000h,4000h,4000h,4000h,4000h,4000h,0,0,0,0,0,0,0,0,0,0,0,0

datasg ends

stacksg segment
	db 0ffh dup (0)
stacksg ends

end start