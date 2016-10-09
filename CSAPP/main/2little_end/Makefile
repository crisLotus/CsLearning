P=show_byte
OBJECTS=
CSAPP_INC =
CFLAGS = -g -Wall -O1
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
