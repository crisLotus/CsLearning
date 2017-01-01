assume cs:codesg, ds:datasg, ss:stacksg

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
	mov es,ax	;显存初始位置
	mov si,0
	mov cx, 0ffffh
	outloop:
		push cx
		;ax存储字符'a'
		mov ax,0
		;判断字母a的机制有问题
		mov al,es:[si]
		mov cx,'a'
		add cx,ax
		sub cx,'a'
		add cx,1
		
		;mov cx,1;;测试所有显示效果
		loop testisA
			mov byte ptr es:[si+1],10000100b
		testisA:
		pop cx
		add si,2
	
	loop outloop
	mov ax,4c00h
	int 21h
	
codesg ends

datasg segment
	dw 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
datasg ends

stacksg segment
	dw 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
stacksg ends

end start