# 文件目录结构
2little_end 第二章判断大小端code
include csapp中的.h file
src csapp中的资源文件
stream 10章系统io


# csapp 函数使用方法笔记

## rio无缓冲输入输出函数

两个函数可以任意顺序交错使用

```code
/*
 * 向fd中读n个字符到usrbuf 无buffer版本 发生中断可以恢复继续执行版本
 */
ssize_t rio_readn(int fd, void *usrbuf, size_t n);

/*
 *
 */
ssize_t rio_writen(int fd, void *usrbuf, size_t n);

```

## rio带缓存的输入输出

```code
/*
 * 向fd中读n个原始字节到usrbuf 有buffer版本 发生中断可以恢复继续执行版本
 * 调用memcpy(), so可以混杂字符和二进制文件
 * 与rio_readn对应，rio_readn只能读字符且无缓冲，而rio_readnb都混合数据有缓存
 */
ssize_t rio_readnb(rio_t *rp, void *usrbuf, size_t n);

/*
 * rio_read - This is a wrapper for the Unix read() function that
 *    transfers min(n, rio_cnt) bytes from an internal buffer to a user
 *    buffer, where n is the number of bytes requested by the user and
 *    rio_cnt is the number of unread bytes in the internal buffer. On
 *    entry, rio_read() refills the internal buffer via a call to
 *    read() if the internal buffer is empty.
 */
static ssize_t rio_read(rio_t *rp, char *usrbuf, size_t n);

```

## rio各函数调用关系

* read (linux read api)
    * rio_read (net stream 有buffer的rio_readn)
        - rio_readnb (有buffer的rio_readn)
        - rio_readlineb
    * rio_readn


# socket网络编程
* socket client open_clientfd
    * socket
    * connect
    * read and write
* socket server  open_listenfd
    * socket
    * bind
    * listen
    * accept
