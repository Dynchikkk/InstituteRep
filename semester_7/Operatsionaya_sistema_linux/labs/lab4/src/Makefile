CFLAGS = -Wall -Wextra -O2 -g
PROGS = main

all: $(PROGS)

$(PROGS): main.c
	$(CC) $(CFLAGS) -o $@ $^

clean:
	rm -f *.o $(PROGS) *~ core
