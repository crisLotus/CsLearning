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

sleep_plus:
	;para times: 

	;usage:
	;mov ax,10
	;push ax
	;call sleep_plus:
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

