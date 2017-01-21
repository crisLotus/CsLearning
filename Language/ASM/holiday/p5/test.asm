assume cs:codesg, ds:datasg, ss:stacksg

codesg segment
start:	
	;init registor
	;mov ax,codesg
	;mov cs,ax
	mov ax,datasg
s:	mov ds,ax	;ds:datasg
	mov ax,stacksg
	mov ss,ax	;ss:stacksg
	mov sp,0	;sp:
	
	mov ax,datasg
	mov ax,1
	mov ax,s
	
	mov ax,s+1
	mov ax,offset s
	mov ax,offset s+1
	
	mov ax,4c00h
	int 21h
	
codesg ends

datasg segment
	;db 0ffffh dup (0)
	a dw 0,0,0,0,0
	b dw 0
datasg ends

stacksg segment
	db 0ffffh dup (0)
stacksg ends

end start