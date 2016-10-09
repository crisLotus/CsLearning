# csappCodeHomeWork
csapp 代码

c 代码风格
```c
/*
 * rio_writen - Robustly write n bytes (unbuffered)
 */
/* $begin rio_writen */
ssize_t rio_writen(int fd, void *usrbuf, size_t n)
{
    size_t nleft = n;
    ssize_t nwritten;
    char *bufp = usrbuf;

    while (nleft > 0) {
    	if ((nwritten = write(fd, bufp, nleft)) <= 0) {
    	    if (errno == EINTR)  /* Interrupted by sig handler return and call write() again */
    		      nwritten = 0;    
    	    else
    		      return -1;       /* errno set by write() */
    	}
    	nleft -= nwritten;
    	bufp += nwritten;
    }
    return n;
}
/* $end rio_writen */
```
