## 思路
int nyear = 0;

循环21次：
    循环2次
        [nyear].year[si] = year[nyear][si]
    循环2次
        [nyear].summ[si] = summ[nyear][si]
    [nyear].ne[si] = ne[nyear][si]
## 伪代码
int nyear = 0;



nyear = 0 - 21:
    bx = nyear * 4
    bp = nyear*10h
    si = 0, 2:
        es:[bp].0[si] = 0[bx][si]
    si = 0, 2:
        es:[bp].5[si] = 84[bx][si]
    es:[bp].0ah[si] = 168[bx][si]

    es:[bp].0dh[si] = 84[bx][si] / 168[bx][si]


```
    ;nyear = 0 - 21:
    nyear es:[150h]

    mov word ptr nyear,0
    mov cx,21
    main_loop:
        
        ;bx = nyear * 4
        mov bx,nyear
        add bx,bx
        add bx,bx
        
        ;bp = nyear*10h
        mov bp,nyear
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
            mov [bp].0[si],ax

            ;[bp].5[si] = 84[bx][si]
            mov ax,84[bx][si]
            mov [bp].5[si],ax

            add si,2
        loop loop1
        pop cx

        ;[bp].0ah[si] = 168[bx][si]
        mov ax,168[bx]
        mov [bp].0ah,ax

        ;下一年
        add word ptr es:[150h],1
    loop main_loop
```