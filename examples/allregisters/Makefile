init:
	go mod init allregisters

build_by_asm:
	$(go env GOTOOLDIR)/asm -o build/all_registers.o  -I "$(go env GOROOT)/pkg/include" pkg/all_registers.s
	#go tool asm -o build/all_registers.o  -I "$(go env GOROOT)/pkg/include" pkg/all_registers.s

build_go:
	go build -o build/main.o -buildmode=default  main.go
