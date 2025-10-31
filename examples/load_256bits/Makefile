
build_test:
	go test -c -o load_256bits.test -gcflags="all=-N -l"

install_dlv:
	go install github.com/go-delve/delve/cmd/dlv@latest

run_dlv:
	~/go/bin/dlv test -- -test.run ^Test_Load256Bits_1$
			