assume cs:codesg, ds:datasg, ss:stacksg

;;
;; ������˸
;;
codesg segment
start:	
	;init registor
	;mov ax,codesg
	;mov cs,ax
	mov ax,datasg
	mov ds,ax	;ds:datasg
	mov ax,stacksg
	mov ss,ax	;ss:stacksg
	mov sp,22h	;sp:
	
	mov ax,0b800h
	mov es,ax
	
	mov cx,9999
	outloop:
		push cx
		mov si,0
		mov di,0
		mov cx,16
		loo:
			mov al,ds:[si]
			mov ah,00000010b ;��ɫ
			mov es:[0a0h*12+di],ax
			add si,1
			add di,2
		loop loo
		pop cx
		
		;�ӳ�
		push cx
			mov cx,0fh  ;ע�⣺�ı��cxֵ�ɸı���ʱ��ʱ�䳤��
  			s0:push cx
     			mov cx,0ffffh
  			s1:sub dx,dx
     			loop s1
     			pop cx
     			loop s0
		pop cx
		
		push cx
		mov si,0
		mov di,0
		mov cx,16
		loo2:
			mov al,ds:[si]
			mov ah,00001110b ;��ɫ
			mov es:[0a0h*12+di],ax
			add si,1
			add di,2
		loop loo2
		pop cx
		
		;�ӳ�
		push cx
			mov cx,0fh  ;ע�⣺�ı��cxֵ�ɸı���ʱ��ʱ�䳤��
  			s5:push cx
     			mov cx,0ffffh
  			s4:sub dx,dx
     			loop s4
     			pop cx
     			loop s5
		pop cx
		
	loop outloop
	mov ax,4c00h
	int 21h
	
codesg ends

datasg segment
	db 'welcome to masm!'
datasg ends

stacksg segment
	dw 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
stacksg ends

end start