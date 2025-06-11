
build:
	gcc -o is_const -g -O1 -mavx2 is_const.c

asm:
	gcc -o is_const.S -S -g -O3 -mavx2 is_const.c

install:
	go install github.com/kelindar/gocc/cmd/gocc@latest

to_plan9:
	gocc is_const.c --arch avx2
