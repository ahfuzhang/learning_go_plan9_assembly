.PHONY: test_c build

init:
	go mod init caesar_crypt

test_c:
	gcc -o build/caesar test/main.c -g -Wall -D_TEST

c:
	clang -o build/c test/main.c -mavx -mavx2 -mavx512f -mavx512vl -mavx512bw -O3 -g

# CGO_LDFLAGS="-static"
# -ldflags="-w -s -extldflags=-static "
build:
	env CC=clang CGO_ENABLED=1  GOOS=linux  GOARCH=amd64 \
	  CGO_CFLAGS="-mavx -mavx2 -mavx512f -mavx512vl -mavx512bw" \
	  CGO_LDFLAGS=""    \
	  go build -x \
	    -gcflags="-B" \
		-ldflags="-w -s " \
	    -o build/caesar_go main.go

buildO3:
	env CC=clang CGO_ENABLED=1  GOOS=linux  GOARCH=amd64 \
	  CGO_CFLAGS="-mavx -mavx2 -mavx512f -mavx512vl -mavx512bw -O3" \
	  CGO_LDFLAGS=""    \
	  go build -x \
	    -gcflags="-B" \
		-ldflags="-w -s " \
	    -o build/caesar_go main.go

buildO3_no_avx512:
	env CC=clang CGO_ENABLED=1  GOOS=linux  GOARCH=amd64 \
	  CGO_CFLAGS="-mavx -mavx2 -O3" \
	  CGO_LDFLAGS=""    \
	  go build -x \
	    -gcflags="-B" \
		-ldflags="-w -s " \
	    -o build/caesar_go main.go

install:
	wget https://ftp.gnu.org/gnu/gcc/gcc-13.2.0/gcc-13.2.0.tar.gz
	sudo yum update
	sudo yum install gcc
	sudo yum install clang

disasm:
	clang -S -o build/c.S test/main.c \
	  -mavx -mavx2 -mavx512f -mavx512vl -mavx512bw -O3 \
      -fverbose-asm -g

objdump:
	objdump -S -d build/c > build/caesar_objdump_O3.s
