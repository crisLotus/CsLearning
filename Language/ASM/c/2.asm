assume cs:codesg, ds:datasg, ss:stacksg

codesg segment
start:	

	;程序功能：绿色的A 轮播
	
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
	
	mov cx,03h
	tout:
		mov bx,0a0h*12-2
		push cx
		mov cx,80
		tin:
	
		mov al,0
		mov ah,00000000b
		mov es:[bx+2],ax
	
		mov al,'A'
		mov ah,00000010b ;绿色
		mov es:[bx],ax
	
		push cx
			mov cx,0ffffh
			a:
			loop a
			mov cx,0ffffh
			b:
			loop b
			mov cx,0ffffh
			v:
			loop v
		pop cx
		sub bx,2
		loop tin
		pop cx
		mov bx,0
		mov al,0
		mov ah,00000000b
		mov es:[bx],ax
	loop tout
		
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