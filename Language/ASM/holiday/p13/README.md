
程序设计项目十三
    
编写左手逃生法则演示程序。参看demo7.gif示例。
    
提示：
（1）地图中只有三种元素：墙、通道、出口。设计地图时，要给不同的元素赋予不同的编码。
（2）什么情况下改变行进的方向。遇到这些情况后根据当前方向决定下一步方向变化的规律是什么。
（3）左手逃生法则简述：在一个有出入口，没有回路的迷宫中，一直保持左手贴着墙壁向前走，总能找到迷宫出口。

空白  0
墙    40h
终点  20h

* 先画地图，python来解析，创建字符串作为汇编的代码
* 地图画好后，开始写蛇的逻辑
* 有点问题 获得内存中的数据，并判断是否为墙，根据是否为墙进行转向还是前进 left_is_none 有问题

dir 方向 ;左0 下1 右2 上3
position_row
position_col

* main loop move
```
left_is_none:
front_is_none:
right_is_none:

if left_is_none:
    turn_left
    move_straight
    ret
if front_is_none:
    move_straight
    ret
if right_is_none:
    turn_right
    move_straight
    ret
```

* 函数库
    * sleep_
    * _print_c_
    * _get_screen_mem
    * print_map_fun_
    * move_straight
    * turn_right
    * turn_left
    * left_is_none
    * front_is_none
    * right_is_none

mov ax,col
pop ax
mov ax,row
pop ax
call _get_screen_mem


move_straight:
    if dir == 0:
        position_col -1
        print position_row position_col <
    if dir == 1:
        position_row +1
        print position_row position_col v
    if dir == 2:
        position_col +1
        print position_row position_col >
    if dir == 3:
        position_row -1
        print position_row position_col ^

turn_left:
    if dir == 0:
        dir = 1
        print position_row position_col v
    if dir == 1:
        dir = 2
        print position_row position_col >
    if dir == 2:
        dir = 3
        print position_row position_col ^
    if dir == 3:
        dir = 0
        print position_row position_col <

turn_right:
    if dir == 0:
        dir = 3
        print position_row position_col ^
    if dir == 1:
        dir = 0
        print position_row position_col <
    if dir == 2:
        dir = 1
        print position_row position_col v
    if dir == 3:
        dir = 2
        print position_row position_col >

left_is_none:
    if dir == 0:
        row+1
        if row > 24:
            ret not none
        get_mem row col
    if dir == 1:
        col+1
        if col > 79:
            ret not none
        get_mem row col
    if dir == 2:
        row-1
        if row < 0:
            ret not none
        get_mem row col
    if dir == 3:
        col-1
        if col < 0:
            ret not none
        get_mem row col

front_is_none:
    if dir == 0:
        col-1
    if dir == 1:
        row+1
    if dir == 2:
        col+1
    if dir == 3:
        row-1

right_is_none:
    if dir == 0:
        row-1
    if dir == 1:
        col-1
    if dir == 2:
        row+1
    if dir == 3:
        col+1

mov ax,cs:m_p_col
pop ax
mov ax,cs:m_p_row
pop ax
call _get_screen_mem

m_p_row dw 14
m_p_col dw 79
m_p_dire dw 0 ;左0 下1 右2 上3
