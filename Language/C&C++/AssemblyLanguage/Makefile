P=test
OBJECTS=
CFLAGS = -g -Wall -O3 -g
LDLIBS=
CC=c99

cleanfile += $(OBJECTS) $(P)

$(P): $(OBJECTS)

.PHONY : clean
clean :
	-rm $(cleanfile)
	-rm *.s *.out *.o

as:
	gcc -S test.c
