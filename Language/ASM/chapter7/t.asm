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
	
	mov bx,0
	mov al,[bx]
	mov al,[bx+200]
	mov al,200[bx]
	mov al,[bx].200
	and al,11011111b
	mov [bx],al
	
	mov ax,4c00h
	int 21h
	
codesg ends

datasg segment
	a db 'abcdefghi'
	b dw 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
datasg ends

stacksg segment
	dw 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
stacksg ends

end start