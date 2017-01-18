assume cs:codesg, ds:datasg, ss:stacksg

calculate segment
        db '1. 3/1=         '
        db '2. 5+3=         '
        db '3. 9-3=         '
        db '4. 4+5=         '
calculate ends

codesg segment
start:	
	;init registor
	;mov ax,codesg
	;mov cs,ax
	mov ax,calculate
	mov ds,ax	;ds:datasg
	mov ax,stacksg
	mov ss,ax	;ss:stacksg
	mov sp,0	;sp:
	mov bx,0
	mov cx,4
main:
	;保存状态
	push cx
	mov al,ds:[bx+4]
	
	mov cl,al
	sub cl,'+'
	jcxz add_tag
	
	mov cl,al
	sub cl,'-'
	jcxz sub_tag
	
	mov cl,al
	sub cl,'/'
	jcxz div_tag
	
recover:
	;结果放到等号后面
	add al,30h
	mov ds:[bx+7],al
	;恢复状态
	pop cx
	add bx,10h
	loop main
	
	mov ax,0b800h
	mov es,ax
	mov bx,0a0h*12+20*2
	mov si,0
	mov di,0
	mov cx,4
print_out:
	push cx
	mov cx,10h
print_in:
	mov al,ds:[si]
	mov ah,01110001b
	mov es:[bx+di],ax
	add si,1
	add di,2
	loop print_in
	pop cx
	mov di,0
	add bx,0a0h;换行
	loop print_out
	mov ax,4c00h
	int 21h
	
add_tag:
	mov ax,0
	mov al,ds:[bx+3]
	sub al,30h
	mov dl,ds:[bx+5]
	sub dl,30h
	add al,dl
	jmp recover
sub_tag:
	mov ax,0
	mov al,ds:[bx+3]
	sub al,30h
	mov dl,ds:[bx+5]
	sub dl,30h
	sub al,dl
	jmp recover
div_tag:
	mov ax,0
	mov dx,0
	mov al,[bx+3]
	sub al,30h
	mov dl,ds:[bx+5]
	sub dl,30h
	div dl
	mov dl,ah;余数
	mov ah,0
	jmp recover
	
codesg ends

datasg segment
	;db 0ffffh dup (0)
	aa dw 0,0,0,0,0
datasg ends

stacksg segment
	db 0ffffh dup (0)
stacksg ends

end start