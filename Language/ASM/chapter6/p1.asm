assume cs:codesg, ds:a, ss:stacksg

a segment
	db 1,2,3,4,5,6,7,8
a ends

b segment
	db 1,2,3,4,5,6,7,8,1,2,3,4,5,6,7,8,1,2,3,4,5,6,7,8
b ends

stacksg segment
	db 0,0,0,0,0,0,0,0
stacksg ends

codesg segment
start:
	;init registor
	mov ax,a
	mov ds,ax
	mov ax,b
	mov es,ax
	mov ax,stacksg
	mov ss,ax
	mov sp,0
	mov ax,0
	
	mov ax,4c00h
	int 21h
codesg ends

end start
