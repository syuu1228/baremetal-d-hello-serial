all: kernel.bin

AS = i686-gdcproject-linux-gnu/bin/i686-gdcproject-linux-gnu-as
CC = i686-gdcproject-linux-gnu/bin/i686-gdcproject-linux-gnu-cc
GDC = i686-gdcproject-linux-gnu/bin/i686-gdcproject-linux-gnu-gdc

i686-gdcproject-linux-gnu:
	wget http://gdcproject.org/downloads/binaries/x86_64-linux-gnu/i686-linux-gnu_2.065_gcc4.9.0_a8ad6a6678_20140615.tar.xz
	tar xvpf i686-linux-gnu_2.065_gcc4.9.0_a8ad6a6678_20140615.tar.xz

boot.o: boot.s
	$(AS) -c boot.s -o boot.o

io.o: io.c
	$(CC) -c io.c -o io.o

kernel.o: kernel.d
	$(GDC) -c kernel.d -o kernel.o

kernel.bin: i686-gdcproject-linux-gnu boot.o kernel.o io.o
	$(CC) -T linker.ld -o kernel.bin -ffreestanding -nostdlib boot.o kernel.o io.o -lgcc

run:
	qemu-system-i386 -nographic -kernel kernel.bin

clean:
	rm -f *.o kernel.bin
