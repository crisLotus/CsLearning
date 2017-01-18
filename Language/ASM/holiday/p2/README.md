程序设计项目二

对加密的字符串进行解密。

要求：
（1）加密的字符串放在Cryptography段。
（2）解密方法：将Cryptography段的每个字符的ASCII值减去1。 
（3）用汇编语言实现程序，将Cryptography段的数据按照解密方法进行解密，将解密后的数据放在PlainText段，然后再把解密之后的字符串以白底蓝字方式显示到屏幕中间。
（4）密文和明文的数据段定义如下：
Cryptography segment
        db 'tqsfbe!zpvs!xjoht'
        db '!!cf!zpvs!nbtufs!'
Cryptography ends

PlainText segment
        db 2*17 dup (' ')
PlainText ends