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
	mov sp,22h	;sp:22h
	mov ax,0020h
	mov es,ax	;es:0020h
	
	mov cx,8	;% cx = 8
	mov ax,1
	mov ds:[0],ax	;% x = 1 每行*的个数
	mov ax,7
	mov ds:[2],ax	;% y = 7 循环行数
a:
	push cx
	mov cx,ds:[0]	;cx = x
	mov bx,ds:[2]	;bx = y
	b:
		mov al,'*'
		mov es:[bx],al
		add bx,1  ;% bx = bx + 1
	loop b

	mov ax,es
	add ax,1h
	mov es,ax
	pop cx
	mov ax,ds:[2]  ;% y = y - 1
	sub ax,1
	mov ds:[2],ax
	
	mov ax,ds:[0]  ;% x = x + 2 
	add ax,2
	mov ds:[0],ax 
loop a
	
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