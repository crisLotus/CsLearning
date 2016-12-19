assume cs:codesg, ds:datasg, ss:stacksg

codesg segment
start:	

	;程序功能：显示绿色的A
	
	;init registor
	;mov ax,codesg
	;mov cs,ax
	mov ax,datasg
	mov ds,ax	;ds:datasg
	mov ax,stacksg
	mov ss,ax	;ss:stacksg
	mov sp,22h	;sp:22h
	mov ax,0b800h
	mov es,ax
	
	mov al,'A'
	mov ah,00000010b ;绿色
	mov bx,0
	mov es:[bx],ax
	
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