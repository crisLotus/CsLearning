assume cs:codesg, ds:datasg, ss:stacksg

;div_dw dw型除法子程序
;

codesg segment
start:	
	;init registor
	;mov ax,codesg
	;mov cs,ax
	mov ax,datasg
	mov ds,ax	;ds:datasg
	mov ax,stacksg
	mov ss,ax	;ss:stacksg
	mov sp,0	;sp:
	
	mov dx,0ffffh
	mov ax,0ffffh
	mov cx,10h
	call div_dw;dx0fffh axffffh cx0
	
	mov dx,0
	mov ax,0
	mov cx,2
	call div_dw;dx0 ax0 cx0
	
	mov dx,1
	mov ax,1000h
	mov cx,1
	call div_dw;dx1 ax1000h cx0
	
	mov ax,4c00h
	int 21h
	
div_dw:

	;(dx*10000h+ax)/cx
	;input:	被除数Hdx Lax，除数:cx
	;output:商:Hdx Lax，余数:cx
	
	;Usage:
	;mov dx,1 ;被除数高16bit
	;mov ax,1000h ;被除数低16bit
	;mov cx,1		;除数
	;call div_dw;dx1 ax1000h cx0
	
	;init
	push bp
	mov bp,sp

	;ax = dx,store src ax
	push ax;store src ax
	push dx
	pop ax
	
	;heigh div
	mov dx,0
	div cx
	push ax;src heigh bit
	
	;low div
	mov ax,ss:[bp-2];receive src ax
	div cx
	mov cx,dx
	pop dx
	add sp,2
	
	;restore
	pop bp
	ret
	
	
codesg ends

datasg segment
	;db 0ffffh dup (0)
	aa dw 0,0,0,0,0
datasg ends

stacksg segment
	db 0ffffh dup (0)
stacksg ends

end start