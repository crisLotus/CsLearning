assume cs:codesg, ds:datasg, ss:stacksg

;;
;; 把a段中的双字数据当做被除数，b段中的字型数据当除数。
;; 相除后，商放在c段的对应位置
;;

a segment
	dd 0123h,0456h,0789h,0abch
a ends

b segment
	dw 10h,20h,10h,20h
	; 0 4 8 16
b ends

c segment
	dw 0,0,0,0
c ends

codesg segment
start:	
	;init registor
	;mov ax,codesg
	;mov cs,ax
	mov ax,a
	mov ds,ax	;ds:datasg
	mov ax,stacksg
	mov ss,ax	;ss:stacksg
	mov sp,20h	;sp:
	
	; bx si di
	; a
	; a:[bx]
	; a:[16+si]
	; a:[32+si]
	mov bx,0
	mov si,0
	mov cx,3
	s:
		mov ax,ds:[bx]
		mov dx,ds:[bx+2]
		div word ptr ds:[16+si]
		mov ds:[32+si],ax
		add si,2
		add bx, 4
	loop s
	
	mov ax,4c00h
	int 21h
	
codesg ends

datasg segment
	dw 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
datasg ends

stacksg segment
	dw 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
stacksg ends

end start