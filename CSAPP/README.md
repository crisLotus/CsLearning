# csappCodeHomeWork
csapp 代码

c 代码风格
```c
/*
 * rio_readn - Robustly read n bytes (unbuffered)
 */
/* $begin rio_readn */
ssize_t rio_readn(int fd, void *usrbuf, size_t n) 
{
    size_t nleft = n;
    ssize_t nread;
    char *bufp = usrbuf;

    while (nleft > 0) {
    if ((nread = read(fd, bufp, nleft)) < 0) {
        if (errno == EINTR) /* Interrupted by sig handler return */
        nread = 0;      /* and call read() again */
        else
        return -1;      /* errno set by read() */ 
    } 
    else if (nread == 0)
        break;              /* EOF */
    nleft -= nread;
    bufp += nread;
    }
    return (n - nleft);         /* Return >= 0 */
}
/* $end rio_readn */


/* 
 * rio_read - This is a wrapper for the Unix read() function that
 *    transfers min(n, rio_cnt) bytes from an internal buffer to a user
 *    buffer, where n is the number of bytes requested by the user and
 *    rio_cnt is the number of unread bytes in the internal buffer. On
 *    entry, rio_read() refills the internal buffer via a call to
 *    read() if the internal buffer is empty.
 */
/* $begin rio_read */
static ssize_t rio_read(rio_t *rp, char *usrbuf, size_t n)
{
    int cnt;

    while (rp->rio_cnt <= 0) {  /* Refill if buf is empty */
    rp->rio_cnt = read(rp->rio_fd, rp->rio_buf, 
               sizeof(rp->rio_buf));
    if (rp->rio_cnt < 0) {
        if (errno != EINTR) /* Interrupted by sig handler return */
        return -1;
    }
    else if (rp->rio_cnt == 0)  /* EOF */
        return 0;
    else 
        rp->rio_bufptr = rp->rio_buf; /* Reset buffer ptr */
    }

    /* Copy min(n, rp->rio_cnt) bytes from internal buf to user buf */
    cnt = n;          
    if (rp->rio_cnt < n)   
    cnt = rp->rio_cnt;
    memcpy(usrbuf, rp->rio_bufptr, cnt);
    rp->rio_bufptr += cnt;
    rp->rio_cnt -= cnt;
    return cnt;
}
/* $end rio_read */
```
