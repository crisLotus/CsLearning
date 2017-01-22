assume cs:codesg, ds:datasg, ss:stacksg

;display_number_str
;������ת��Ϊ�ַ�������ʾ����

codesg segment
start:	
	;init registor
	mov ax,datasg
	mov ds,ax	;ds:datasg
	mov ax,stacksg
	mov ss,ax	;ss:stacksg
	mov sp,0	;sp:
	
	mov dx,0
	mov ax,1234
	call display_number_str;1234
	
	mov dx,1
	mov ax,1234
	call display_number_str;66770
	
	mov dx,1234
	mov ax,1234
	call display_number_str;80872658
	
	
	mov ax,4c00h
	int 21h
	
display_number_str:
	;input 	dx ax
	;output ת�����ַ�������ʾ
	;mov dx,0 ����dx32λ֧�ֶ�ȥ������
	
	;Usage:
	;mov dx,0
	;mov ax,1234
	;call display_number_str;1234
	
	push es
	push bx
	push di
	push cx
	
	mov bx,0 		;����
	
	dx_ax_not_eq_0:
	mov cx,10
	call div_dw
	push cx
	inc bx			;����+1
	cmp dx,0
	jne dx_ax_not_eq_0
	cmp ax,0
	jne dx_ax_not_eq_0
	
	mov ax,0b800h
	mov es,ax
	mov di,0 ;������Ļ�ַ�����,��ʼ��
	mov cx,bx  ;ȡ��ѭ��������֮���������ʹ��
	mov bx,0a0h*8
	print:
	pop ax
	mov ah,2
	add ax,'0'
	mov es:[bx+di],ax
	add di,2
	loop print
	
	;receive
	pop cx
	pop di
	pop bx
	pop es
	ret

div_dw:

	;(dx*10000h+ax)/cx
	;input:	������Hdx Lax������:cx
	;output:��:Hdx Lax������:cx
	
	;init
	push bp
	mov bp,sp

	;ax = dx,store src ax
	push ax;store src ax
	push dx
	pop ax
	
	;heigh div
	mov dx,0
	div cx
	push ax;src heigh bit
	
	;low div
	mov ax,ss:[bp-2];receive src ax
	div cx
	mov cx,dx
	pop dx
	add sp,2
	
	;restore
	pop bp
	ret
	
codesg ends

datasg segment
	;db 0ffffh dup (0)
	aa dw 0,0,0,0,0
datasg ends

stacksg segment
	db 0ffffh dup (0)
stacksg ends

end start