assume cs:codesg, ds:datasg, ss:stacksg

;template

codesg segment
start:	
	;init registor
	mov ax,datasg
	mov ds,ax	;ds:datasg
	mov ax,stacksg
	mov ss,ax	;ss:stacksg
	mov sp,100h	;sp:

	;your code
	call clean_screen_func
	call print_all_screen
	call refresh_screen

	mov ax,4c00h
	int 21h

print_all_screen:
	jmp print_all_screen_start
	len_index dw 0
	row_index dw 0
	chr_index dw 0
	print_all_screen_start:
	push cx
	push bx
	push dx
	mov bx,0
	mov cx,80
	print_all_screen_loop:
	mov bx,cs:chr_index;start_chr_index
	mov ax,rand_chr[bx]
	push ax
	mov bx,cs:len_index
	mov ax,rand_len[bx];len
	push ax
	mov bx,cs:row_index
	mov ax,rand_row[bx];row
	push ax
	mov ax,cx;col
	push ax
	call print_1_col
	
	add cs:len_index,2
	add cs:row_index,2
	add cs:chr_index,2
	
	loop print_all_screen_loop
	pop dx
	pop bx
	pop cx
	ret

clean_screen_func:
	push ax
	push bx
	push cx
	push es
	
	mov ax,0b800h
	mov es,ax
	mov bx,0
	mov cx,80*25
	clean_screen_:
	mov word ptr es:[bx],0700h
	add bx,2
	loop clean_screen_
	pop es
	pop cx
	pop bx
	pop ax
	ret
	
refresh_screen:
	mov cx,100h;刷新次数
	refresh_screen_:
	push cx
	mov cx,80
	in_loop:
	mov ax,cx	;col
	sub ax,1
	push ax
	call refresh_1_col
	
	loop in_loop
	pop cx
	mov ax,1;刷新频率
	push ax
	call sleep_plus
	loop refresh_screen_
	ret

print_1_col:
	;Usage:
	;	col					4
	;	row					6
	;	len					8
	;	start_chr_index		10
	;mov ax,start_chr_index
	;push ax
	;mov ax,len
	;push ax
	;mov ax,row
	;push ax
	;mov ax,col
	;push ax
	;call print_1_col
	push bp
	mov bp,sp
	push ax
	push bx
	push cx
	push dx
	push si
	mov si,ss:[bp+10]
	
	mov cx,ss:[bp+8]
	print_1_col_loop:
	mov dx,0
	mov ax,ss:[bp+6]	;row
	mov bx,25
	div bx
	mov ss:[bp+6],dx
	
	mov ax,10	;att
	push ax
	mov ax,rand_chr[si]	;char
	push ax
	mov ax,ss:[bp+4]	;col
	push ax
	mov ax,ss:[bp+6]	;row
	push ax
	call _print_c_
	
	add word ptr ss:[bp+6],1
	add si,2
	loop print_1_col_loop
	
	pop si
	pop dx
	pop cx
	pop bx
	pop ax
	pop bp
	ret 8
	
refresh_1_col:
	;argc:
	;	col	4	列
	;mov ax,1
	;push ax
	;call refresh_1_col
	jmp refresh_1_col_start
	tail_char dw 0
	refresh_1_col_row_ dw 0
	refresh_1_col_start:
	push bp
	mov bp,sp
	push ax
	push bx
	push cx
	push es
	
	mov ax,0b800h
	mov es,ax
	mov ax,0a0h
	mov cx,24
	mul cx	;row * 0a0h
	mov bx, ax
	mov ax,ss:[bp+4];col
	add ax,ax
	add bx,ax
	mov ax,es:[bx]
	mov cs:tail_char,ax;?
	
	mov cx,24	;row
	refresh_1_col_main_loop:
	mov ax,ss:[bp+4]	;col
	push ax
	mov ax,cx	;row
	sub ax,1
	push ax
	call refresh_print_c
	loop refresh_1_col_main_loop
	
	mov ax,0b800h
	mov es,ax
	mov bx, 0;row
	mov ax,ss:[bp+4];col
	add ax,ax
	add bx,ax
	mov ax,cs:tail_char
	mov es:[bx],ax;?
	
	pop es
	pop cx
	pop bx
	pop ax
	pop bp
	ret 2
	
refresh_print_c:
	;将当前的字符下移一位
	;argc:
	;	row		4	行 0-24
	;	col		6	列 0-79
	;mov ax,col
	;push ax
	;mov ax,row
	;push ax
	;call refresh_print_c
	push bp
	mov bp,sp
	push es
	push bx
	push ax
	
	mov ax,0b800h
	mov es,ax
	
	mov ax,0a0h
	mul word ptr ss:[bp+4]	;row * 0a0h
	mov bx, ax
	mov ax,ss:[bp+6]
	add ax,ax
	add bx,ax
	
	mov ax,10;att 1 2 4 8
	push ax
	mov ax,es:[bx]
	push ax
	mov ax,ss:[bp+6];col
	push ax
	mov ax,ss:[bp+4];row
	add ax,1
	push ax
	call _print_c_
	
	pop ax
	pop bx
	pop es
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
	mul word ptr ss:[bp+4]	;row * 0a0h
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
	
sleep_plus:
	;para times: 

	;usage:
	;mov ax,10
	;push ax
	;call sleep_plus
	push bp
	mov bp,sp

	push cx	
	mov cx,ss:[bp+4]  ;注意：改变此cx值可改变延时的时间长短
	s0:push cx
	mov cx,0ffffh
	s1:sub dx,dx
	loop s1
	pop cx
	loop s0
	pop cx
	
	pop bp
	ret 2

codesg ends

datasg segment

	rand_len dw 10,17,11,17,10,15,20,18,12,18,16,13,10,10,11,18,11,11,14,16,20,12,10,17,20,12,19,20,14,12,16,12,17,17,19,13,13,11,11,11,17,16,10,20,13,13,16,20,11,20,16,17,20,15,16,20,14,11
	dw 10,13,12,14,15,10,17,14,11,10,15,12,11,19,13,16,19,13,14,11,10,13

	rand_row dw 10,11,23,16,8,2,8,0,21,18,17,4,25,25,13,25,11,20,20,7,6,13,15,11,20,8,8,5,15,23,19,13,2,8,3,2,24,7,10,2,6,23,25,24,24,23,2,24,8,1,19,19,23,16,22,0,10,15,18,11,14,24,6,11,9,24,24,8,3,12,12,1,5,4,19,9,10,17,6,14

	rand_chr dw 105,16,124,26,113,33,57,30,125,105,121,126,78,128,101,49,106,112,50,62,99,119,11,62,29,26,75,61,36,108,59,96,80,6,31,53,58,36,43,64,71,68,41,34,104,11,75
	dw 126,85,109,6,84,108,9,40,84,85,58,101,87,52,82,84,9,33,50,101,21,1,22,35,36,43,101,41,104,18,41,116,99

datasg ends

stacksg segment
	db 0ffh dup (0)
stacksg ends

end start