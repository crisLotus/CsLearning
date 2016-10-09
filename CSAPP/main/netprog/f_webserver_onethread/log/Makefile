CC = gcc

CSAPP_INC =
CSAPP_SRC =
LDLIBS = -lpthread
CFLAGS = -Wall -O2 -I .
PROGS =	test

all: log.o

log.o: log.h
$(PROGS): log.o log.h

test: log.o log.h

.PHONY : clean

clean :
	-rm $(PROGS) *.o
	-rm *.log
