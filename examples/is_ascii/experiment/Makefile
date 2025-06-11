
bound_check:
	go build -gcflags="-d=ssa/check_bce/debug=1" ./

bc:
	go build -gcflags="-d=ssa/check_bce" experiment

asm:
	go tool compile -S is_ascii.go > is_ascii.s
