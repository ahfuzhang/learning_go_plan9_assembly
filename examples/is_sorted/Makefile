
bound_check:
	go build -gcflags="-d=ssa/check_bce/debug=1" is_sorted/

bc:
	go build -gcflags="-d=ssa/check_bce" is_sorted/

asm:
	go tool compile -S is_sorted.go > is_sorted_raw.asm
