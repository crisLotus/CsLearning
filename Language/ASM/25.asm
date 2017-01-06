assume cs:code
data segment
	db 'welcome to masm!'
data ends

code segment
start:
mov ax,0b800h
mov es,ax
mov ax,data
mov ds,ax
mov cx,16
mov si,0
mov di,0
s:
mov al,ds:[si]
mov ah,1
mov es:[di+0a0h*12],ax
inc si
add di,2
loop s

mov ax,4c00h
int 21h
code ends
end start
