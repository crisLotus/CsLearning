;ֻ�ڶ�������ݶ�'?'�м�����ص����ݣ�ʹ������ĳ����������Ļ�м���ʾһ����ɫ���ַ�'A'��
;data segment
;     dw ?
;data ends
;end
data segment
	dw 00b8h,8eb8h,0bbd8h,07cah,07c7h,0241h,00b8h, 0cd4ch, 0021h
data ends

end

;assume cs:code
;code segment
;	mov ax,0b800h
;	mov ds,ax
;	mov bx,0a0h*12+25h*2
;	mov word ptr ds:[bx],0241h
;	
;	mov ax,4c00h
;	int 21h
;code ends