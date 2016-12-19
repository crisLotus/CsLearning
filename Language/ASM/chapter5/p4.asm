assume cs:codesg

codesg segment
	mov ax,codesg
	mov ds,ax
	mov ax,0020h
	mov es,ax
	mov bx,0
	mov cx,40h
	
	s:mov al,[bx]
	mov es:[bx],al
	inc bx
	loop s
	
	mov ax,4c00h
	int 21h
	
codesg ends

end