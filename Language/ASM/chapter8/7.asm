assume cs:codesg

data segment

	;年份
	db '1975','1976','1977','1978','1979','1980','1981','1982','1983'
	db '1984','1985','1986','1987','1988','1989','1990','1991','1992'
	db '1993','1994','1995'

	;公司总收入  
	dd 16,22,382,1356,2390,8000,16000,24486,50065,97479,140417,197514
	dd 345980,590827,803530,1183000,1843000,2759000,3753000,4649000,5937000
	
	;每年雇员人数
	dw 3,7,9,13,28,38,130,220,476,778,1001,1442,2258,2793,4037,5635,8226
	dw 11542,14430,15257,17800
data ends
;197514 /1442
table segment
	db 21 dup ('year summ ne ?? ')
	db 10h dup (0)
table ends

codesg segment
start:
	;init register
	mov ax,data
	mov ds,ax
	mov ax,stacksg
	mov ss,ax   ;ss:stacksg
	mov sp,20h  ;sp:
	mov ax,table
	mov es,ax
	
	;nyear = 0 ~ 21:
	;nyear es:[150h]
	mov word ptr es:[150h],0
	mov cx,21
	main_loop:
		
		;bx = nyear * 4
		mov bx,es:[150h]
		add bx,bx
		add bx,bx
		
		;bp = nyear*10h
		mov bp,es:[150h]
		add bp,bp
		add bp,bp
		add bp,bp
		add bp,bp

		;si = 0, 2:
		push cx
		mov si,0
		mov cx,2
		loop1:
			;[bp].0[si] = 0[bx][si]
			mov ax,0[bx][si]
			mov es:[bp][si],ax
			
			;[bp].5[si] = 84[bx][si]
			mov ax,84[bx][si]
			mov es:[bp].5[si],ax

			add si,2
		loop loop1
		pop cx
		
		;代码以下没有用到bx，故用bx随意改了
		;[bp].0ah = 168[bx]
		;mov ax,168[bx]
		mov bx,es:[150h]
		add bx,bx
		mov ax,168[bx]
		mov es:[bp].0ah,ax
		
		;[bp].0dh = 84[bx] / 168[bx]
		;mov ax,es:84[bx]
		;mov dx,es:86[bx]
		mov ax,es:[bp].5
		mov dx,es:[bp].7
		div word ptr es:[bp].0ah
		mov es:[bp].0dh,ax
		
		;添加空格
		mov byte ptr es:[bp].4,0
		mov byte ptr es:[bp].9,0
		mov byte ptr es:[bp].0ch,0
		mov byte ptr es:[bp].0fh,0
		
		;下一年
		add word ptr es:[150h],1
	loop main_loop
	
	mov ax,4c00h
	int 21h
codesg ends

stacksg segment
	dw 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
stacksg ends

end start