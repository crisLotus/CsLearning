sleep_:
	push cx	
	mov cx,020h  ;ע�⣺�ı��cxֵ�ɸı���ʱ��ʱ�䳤��
	s0:push cx
	mov cx,0ffffh
	s1:sub dx,dx
	loop s1
	pop cx
	loop s0
	pop cx
	ret