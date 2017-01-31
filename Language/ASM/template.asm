assume cs:codesg, ds:datasg, ss:stacksg

;template

codesg segment
start:	
	;init registor
	mov ax,datasg
	mov ds,ax	;ds:datasg
	mov ax,stacksg
	mov ss,ax	;ss:stacksg
	mov sp,100h	;sp:

	;your code

	mov ax,4c00h
	int 21h
codesg ends

datasg segment
	aa dw 0,0,0,0,0
datasg ends

stacksg segment
	db 0ffh dup (0)
stacksg ends

end start