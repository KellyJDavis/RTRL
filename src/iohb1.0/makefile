CC = gcc
CFLAGS = -g -pedantic -Wunused -Wformat -Wimplicit
IOLIB = iohb.o mmio.o

all:  sample hbrhs2mtx hbmat2mtx hb2mtxstrm

sample : sample.o $(IOLIB)
	$(CC) $(CFLAGS) -o $@ $@.o $(IOLIB)

hbrhs2mtx : hbrhs2mtx.o $(IOLIB)
	$(CC) $(CFLAGS) -o $@ $@.o $(IOLIB)

hbmat2mtx : hbmat2mtx.o $(IOLIB)
	$(CC) $(CFLAGS) -o $@ $@.o $(IOLIB)

hb2mtxstrm : hb2mtxstrm.o $(IOLIB)
	$(CC) $(CFLAGS) -o $@ $@.o $(IOLIB)

clean :
	rm -f *.o  sample hbrhs2mtx hbmat2mtx hb2mtxstrm

.c.o:
	$(CC) $(CFLAGS) -c $*.c
