P=arguments
OBJECTS=
CSAPP_INC = ../../include
CFLAGS = -g -Wall -O3 -I $(CSAPP_INC) -I .
LDLIBS=
CC=c99

cleanfile += $(OBJECTS) $(P)

$(P): $(OBJECTS)

.PHONY : clean
clean :
	-rm $(cleanfile)
	-rm *.s *.out *.o

as:
	gcc -S *.c
