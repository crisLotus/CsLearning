assume cs:codesg, ds:datasg, ss:stacksg

;�Ƚ��ܣ�Cryptography�ε�ÿ���ַ���ASCIIֵ��ȥ1
;�׵�������ʾ

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
	
	;���ܹ���
	mov ax,Cryptography
	mov ds,ax
	mov ax,PlainText
	mov es,ax
	mov si,0
	
	mov cx,34
	decode:
	mov al,ds:[si]
	sub al,1
	mov es:[si],al
	add si,1
	loop decode
	
	;��ʾ����
	mov ax,0b800h
	mov ds,ax
	mov bx,0a0h*12+20*2
	mov si,0
	mov di,0
	mov cx,34
	print:
	mov al,es:[si]
	mov ah,01110001b ;��ɫ
	mov ds:[bx+di],ax
	add si,1
	add di,2
	loop print
	
	mov ax,4c00h
	int 21h
	

	
codesg ends

;34
Cryptography segment
        db 'tqsfbe!zpvs!xjoht'
        db '!!cf!zpvs!nbtufs!'
Cryptography ends

PlainText segment
        db 2*17 dup (' ')
PlainText ends

datasg segment
	;db 0ffffh dup (0)
	aa dw 0,0,0,0,0
datasg ends

stacksg segment
	db 0ffffh dup (0)
stacksg ends

end start