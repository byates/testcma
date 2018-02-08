obj-m += gdriver.o
gdriver-objs := cmabuf.o buffer.o
test_target := test_prog
test_file := testcma.cpp

all: driver
	g++ -g $(test_file) -o $(test_target)

driver:
	make -C /lib/modules/$(shell uname -r)/build/ M=$(PWD) modules

clean:
	make -C /lib/modules/$(shell uname -r)/build/ M=$(PWD) clean
	rm -rf $(test_target)