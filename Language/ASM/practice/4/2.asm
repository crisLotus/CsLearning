assume cs:code

data segment
        db 'abCDefgHijkLmnOpqRstuVwXYZ'
data ends

code segment
start:	mov ax,data
	mov ds,ax
      	mov bx,0

      	mov cx,26
s:    	add byte ptr [bx],00100000b	;����Ҫ�޸���ĸ��ASCII�����20h
      	and byte ptr [bx],01111111b	;����Ӻ����ֵ���λ ��Ϊ0
      	or byte ptr [bx], 01000000b	;����Ӻ����ֵ�θ�λ ��Ϊ1
	;������ָ��Ƚ��м��ɣ�ע����⡣
     	inc bx
     	loop s

        mov ax,4c00h
        int 21h

code ends
end start