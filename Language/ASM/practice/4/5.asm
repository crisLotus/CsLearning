assume cs:codesg, ds:datasg, ss:stacksg

;;
;; 文字闪烁
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
			mov ah,00000010b ;绿色
			mov es:[0a0h*12+di],ax
			add si,1
			add di,2
		loop loo
		pop cx
		
		;延迟
		push cx
			mov cx,0fh  ;注意：改变此cx值可改变延时的时间长短
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
			mov ah,00001110b ;红色
			mov es:[0a0h*12+di],ax
			add si,1
			add di,2
		loop loo2
		pop cx
		
		;延迟
		push cx
			mov cx,0fh  ;注意：改变此cx值可改变延时的时间长短
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