assume cs:code

;;
;; author: exfly
;; ��ĸ��д��Сд��Сд���д
;;

data segment
     db 'HeBEInOnGYedAxUeDAAsSemBLylaNGuAGE'  ;��34���ֽ�
data ends

code segment
start:  
	mov ax,data
	mov ds,ax
	mov bx,0
	
	;bx
	;ds:[34]����cx��ֵ
	mov cx,34
	s:
		mov al,ds:[bx]
		mov ds:[34],cx	;����cx��ֵ
		mov cl,al
		and cx,00100000b;�����Сд��ĸ
		add cx,1
		
		loop a
			;��
			or al,00100000b
			mov ds:[bx],al
			loop b
		a:;��
			and al,11011111b
			mov ds:[bx],al
		b:
		
		inc bx	;�ƶ�����һ���ַ�
		
		mov cx,ds:[34]	;�ָ�cx��ֵ
		
	loop s
	mov ax,4c00h
	int 21h

code ends
end start
Ҫ