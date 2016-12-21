assume cs:code   ss:stack

stack segment
dw 0,0,0,0,0,0,0,0
stack ends

code segment
start:mov ax,stack
      mov ss,ax
      mov sp,16
      mov ax,20h
      mov ds,ax

      mov si,7
      mov di,1
      mov cx,8
  
s0:
      push cx        
      mov cx,di
      mov bx,si
      
s:
      mov ax,'*'
      mov ds:[bx],ax
      add bx,1
      loop s

      add ds,1h
      sub si,1
      inc di
      inc di
      pop cx
      loop s0

mov ax,4c00h
int 21h
code ends

end  start