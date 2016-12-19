assume cs:codesg

codesg segment
	mov ax,2
	mov ax,2
	mov ax,ds:[2]
	mov ax,[2]
	
	mov bx,2
	mov ax,[bx]
	
	mov ax,4c00h
	int 21h
	
codesg ends

end