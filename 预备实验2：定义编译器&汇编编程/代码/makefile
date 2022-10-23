.PHONY: test-fib, clean
test-fib:
	arm-linux-gnueabihf-gcc fib.s sylib.c -o fib.out -static
	qemu-arm ./fib.out
clean:
	rm -fr *.out
