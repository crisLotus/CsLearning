assume cs:codesg

codesg segment
	mov ax,codesg
	mov bx,2000h
	mov ds,ax
	mov es,bx
	mov bx,0
	mov cx,10h
	s:
	mov ax,ds:[bx]
	mov es:[bx],ax
	add bx,2h
	loop s
	
	mov ax,4c00h
	int 21h
codesg ends

end
