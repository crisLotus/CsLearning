assume cs:code,ds:data,ss:stack
;;
;; author: exfly
;; ��data segment�еĴ�д��ĸתС
;;
data segment
    db 'WELCOME TO MASM!'
data ends

stack segment
    dw 0,0,0,0,0,0,0,0
stack ends

code segment
start:
    ;init register
    mov ax,data
        mov ds,ax

        mov ax,stack
        mov ss,ax
        mov sp,10h
    ;init end
    
        mov bx,0
        mov cx,10h
s:  mov al,[bx]
        or al,20h
        mov [bx],al
        inc bx
        loop s

        mov ax,4c00h
        int 21h
code ends
end start
