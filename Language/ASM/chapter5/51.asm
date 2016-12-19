assume cs:codesg

codesg segment
	mov ax,2
	
	mov cx,3
a:	add ax,ax
	loop a
	
	mov ax,4c00h
	int 21h
	
codesg ends

end
