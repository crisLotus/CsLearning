
程序设计项目十三
    
编写左手逃生法则演示程序。参看demo7.gif示例。
    
提示：
（1）地图中只有三种元素：墙、通道、出口。设计地图时，要给不同的元素赋予不同的编码。
（2）什么情况下改变行进的方向。遇到这些情况后根据当前方向决定下一步方向变化的规律是什么。
（3）左手逃生法则简述：在一个有出入口，没有回路的迷宫中，一直保持左手贴着墙壁向前走，总能找到迷宫出口。

def main():
    if end:
        return
    if left not Wall:
        move_left()
        return 
    if forword not wall:
        move_forward()
        return
    if right not wall:
        move_right()
        return
