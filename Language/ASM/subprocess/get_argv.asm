assume cs:codesg, ds:datasg, ss:stacksg

;函数传参
;返回值放到ax中

codesg segment
start:	
	;init registor
	mov ax,datasg
	mov ds,ax	;ds:datasg
	mov ax,stacksg
	mov ss,ax	;ss:stacksg
	mov sp,0	;sp:
	
	mov ax,1
	push ax
	mov ax,3
	push ax
	call add_e
	
	
	mov ax,4c00h
	int 21h
	
add_e:
	push bp
	
	mov bp,sp
	mov ax,ss:[bp+4];3
	;3-1
	sub ax,ss:[bp+6];1
	
	pop bp
	ret 4 ;/2个参数
	
	
codesg ends

datasg segment
	;db 0ffffh dup (0)
	aa dw 0,0,0,0,0
datasg ends

stacksg segment
	db 0ffffh dup (0)
stacksg ends

end start