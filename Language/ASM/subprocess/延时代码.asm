sleep_:
	push cx	
	mov cx,020h  ;注意：改变此cx值可改变延时的时间长短
	s0:push cx
	mov cx,0ffffh
	s1:sub dx,dx
	loop s1
	pop cx
	loop s0
	pop cx
	ret