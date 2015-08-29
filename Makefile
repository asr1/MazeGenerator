obj-m += maze.o

LINUX_SRC = linux-src/linux

all:
	make -C $(LINUX_SRC) M=$(PWD) modules ARCH=um
	gcc maze-cli.c libbmp.c -o maze-cli

clean:
	make -C $(LINUX_SRC) M=$(PWD) clean

