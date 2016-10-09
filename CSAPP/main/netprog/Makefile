CC = gcc

CSAPP_INC = ../../include
CSAPP_SRC = ../../src
CFLAGS = -Wall -O1 -I $(CSAPP_INC) -I .
LDLIBS = -lpthread

PROGS =	fileio3

all: $(PROGS)

$(PROGS): $(CSAPP_SRC)/csapp.o
$(CSAPP_SRC)/csapp.o: $(CSAPP_SRC)/csapp.c $(CSAPP_INC)/csapp.h


.PHONY : clean

clean :
	-rm $(PROGS)
