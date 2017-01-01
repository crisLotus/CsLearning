assume cs:code

;;
;; author: exfly
;; 字母大写变小写，小写变大写
;;

data segment
     db 'HeBEInOnGYedAxUeDAAsSemBLylaNGuAGE'  ;共34个字节
data ends

code segment
start:  
	mov ax,data
	mov ds,ax
	mov bx,0
	
	;bx
	;ds:[34]保存cx的值
	mov cx,34
	s:
		mov al,ds:[bx]
		mov ds:[34],cx	;保存cx的值
		mov cl,al
		and cx,00100000b;如果是小写字母
		add cx,1
		
		loop a
			;否
			or al,00100000b
			mov ds:[bx],al
			loop b
		a:;是
			and al,11011111b
			mov ds:[bx],al
		b:
		
		inc bx	;移动到下一个字符
		
		mov cx,ds:[34]	;恢复cx的值
		
	loop s
	mov ax,4c00h
	int 21h

code ends
end start
要