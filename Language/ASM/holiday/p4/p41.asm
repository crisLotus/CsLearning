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
	mov sp,0	;sp:
	
	;
	mov dx,ds:[0]
	
	;为了此程序的正确执行而执行的复制
	mov ax,ds:[0]
	mov ds:[6],ax
	
	;cx = y -1
	mov ax,ds:[4]
	sub ax,1
	mov cx,ax
	out_l:
		push cx
		
		;cx = x
		mov ax,ds:[0]
		mov cx,ax
		sub cx,1
		
		in_l:
		add dx,ds:[6]
		loop in_l
		
		mov ds:[6],dx
		pop cx
	loop out_l
	
	mov ax,0b800h
	mov es,ax
	mov bx,0a0h*12+20*2
	mov si,0
	mov cx,3
print:
	mov ax,ds:[si]
	mov ah,2
	add ax,'0'
	mov es:[bx],ax
	
	add si,2
	add bx,0a0h
	loop print
	
	mov cx,5
	mov di,0
s1:
	mov al,'-'
	mov ah,2
	mov es:[bx+di],ax
	add di,2
	loop s1
	
	mov si,0
	mov ax,ds:[6]
	mov ds:[8],ax
	mov cx,0
	add bx,0a0h;换行
s3:
	mov ax,ds:[8]
	mov dl,10
	div dl
	mov ds:[8],al
	mov cl,al
	
	mov dh,ah
	mov al,dh
	add al,'0'
	mov ah,2
	push ax
	
	add si,2
	
	jcxz s2
	jmp s3
	
s2:
	mov di,0
s4:
	pop es:[bx+di]
	sub si,2
	add di,2
	mov cx,si
	jcxz s5
	jmp s4
s5:
	mov ax,4c00h
	int 21h
	
codesg ends

datasg segment
	;db 0ffffh dup (0)
	aa dw 4,'^'-'0',3,0,0,0
datasg ends

stacksg segment
	db 0ffffh dup (0)
stacksg ends

end start