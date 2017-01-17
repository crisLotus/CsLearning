assume cs:codesg, ds:datasg, ss:stacksg

codesg segment
start:	
	mov ax,9
	jmp ax
	
	mov ax,4c00h
	int 21h
	
codesg ends

datasg segment
	;db 0ffffh dup (0)
	aa dw 0,0,0,0,0
datasg ends

stacksg segment
	s db 0ffffh dup (0)
stacksg ends

end start