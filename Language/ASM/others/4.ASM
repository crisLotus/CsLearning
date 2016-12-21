assume cs:code

code segment
      mov ax,0020H
      mov ds,ax

      ;以下部分是将要显示的区域全部清零
      mov bx,0000H
      mov cx,128
   s: mov word ptr ds:[bx],0
      add bx,0001H
      loop s

  ;dx用来控制外部循环，即总共有8行
  ;ax用来控制每行2A的个数
      mov dx,10
      mov ax,15
      mov bx,0070H

    k:mov cx,ax
      sub dx,1
    q:mov word ptr ds:[bx],002AH
      add bx,0001H
      loop q
      sub ax,2
      sub bx,0009H
      mov cx,dx
      loop k

      mov ax,4c00H
      int 21H
  code ends
end
