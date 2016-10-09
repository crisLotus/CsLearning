CC = gcc

CSAPP_INC = ../../include
CSAPP_SRC = ../../src
LOG_INC = ./log
LOG_SRC = ./log
CFLAGS = -Wall -O1 -I $(CSAPP_INC) -I . -I $(LOG_INC)
LDLIBS = -lpthread

PROGS =	core

all: $(PROGS)

$(PROGS): $(CSAPP_SRC)/csapp.o $(LOG_SRC)/log.o $(LOG_INC)/log.h
$(CSAPP_SRC)/csapp.o: $(CSAPP_SRC)/csapp.c
$(LOG_SRC)/log.o: $(LOG_INC)/log.h


.PHONY : clean
clean :
	(cd log; make clean)
	-rm $(PROGS)
	-rm *.log
	-rm *.out
