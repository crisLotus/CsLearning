assume cs:codesg, ds:datasg, ss:stacksg

;6.3程序，当栈满时如何处理

codesg segment
start:	
	mov ax,cs
	mov ss,ax
	mov sp,30h
	
	mov bx,0
	mov cx,8
	s:
	push 
	
	mov ax,4c00h
	int 21h
	
codesg ends
end start

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
	
	mov ax,ds:[0]
	mov dx,ds:[2]
	mov bx,1234
	div bx
	
	mov ax,4c00h
	int 21h
	
codesg ends

datasg segment
	dd 12345678,0,0
datasg ends

stacksg segment
	dw 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
stacksg ends

end start