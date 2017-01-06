assume cs:codesg, ds:datasg, ss:stacksg

; 编程实现算法“(1+2+3+4+...+n)>122时的第一个n是多少?”
; 并把此时的和与数据n分别放在上面的数据段的对应位置中。
; (提示：可以考虑负数的二进制数最高位为1)。

codesg segment
start:	
	;init registor
	;mov ax,codesg
	;mov cs,ax
	mov ax,datasg
	mov ds,ax	;ds:datasg
	mov ax,stacksg
	mov ss,ax	;ss:stacksg
	mov sp,20h	;sp:
	mov cx, 100h
	mov ax,1 ;存储 和
	mov dx,1 ;存储循环次数
	testt:
		push cx
		
		mov cx,10000000b
		add dx,1
		add ax,dx
		
		mov cx,ax
		sub cx,122
		
		and cx,1000000000000000b
		sub cx,1000000000000000b
		add cx,1
		loop endloop
		
		pop cx
	loop testt
	
	endloop:
	
	mov ds:[0],ax
	mov ds:[2],dx
	
	mov ax,4c00h
	int 21h
	
codesg ends

datasg segment
	dw 0,0
datasg ends 

stacksg segment
	dw 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
stacksg ends

end start