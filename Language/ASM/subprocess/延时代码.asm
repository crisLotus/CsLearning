sleep_:
	push cx	
	mov cx,08h  ;ע�⣺�ı��cxֵ�ɸı���ʱ��ʱ�䳤��
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
	mov cx,ss:[bp+4]  ;ע�⣺�ı��cxֵ�ɸı���ʱ��ʱ�䳤��
	s0:push cx
	mov cx,0ffffh
	s1:sub dx,dx
	loop s1
	pop cx
	loop s0
	pop cx
	
	pop bp
	ret 2

