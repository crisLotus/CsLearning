assume cs:code

data segment
        db 'abCDefgHijkLmnOpqRstuVwXYZ'
data ends

code segment
start:	mov ax,data
	mov ds,ax
      	mov bx,0

      	mov cx,26
s:    	add byte ptr [bx],00100000b	;将需要修改字母的ASCII码加上20h
      	and byte ptr [bx],01111111b	;将相加后的数值最高位 置为0
      	or byte ptr [bx], 01000000b	;将相加后的数值次高位 置为1
	;这三句指令比较有技巧，注意理解。
     	inc bx
     	loop s

        mov ax,4c00h
        int 21h

code ends
end start