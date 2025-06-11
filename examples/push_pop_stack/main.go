package main

import (
	"fmt"
	"push_pop_stack/pkg"
	"time"
)

const runTimes = 2000000

func benchmarkStackAlloc(size int64) {
	start := time.Now()
	for i := 0; i < runTimes; i++ {
		pkg.StackAlloc(size)
	}
	span := time.Since(start)
	fmt.Printf("size(kb):%d total:%d us, avg:%.4f ns/op\n", size/1024,
		span.Microseconds(), float64(span.Microseconds())*1000.0/float64(runTimes))
}

func main() {
	fmt.Println("hello")
	fmt.Printf("GetStackPointerAddress:%08x\n", pkg.GetStackPointerAddress())
	pkg.StackAlloc(1024)
	benchmarkStackAlloc(1024)
	benchmarkStackAlloc(1024 * 2)
	benchmarkStackAlloc(1024 * 4)
	benchmarkStackAlloc(1024 * 8)
	benchmarkStackAlloc(1024 * 16)
	benchmarkStackAlloc(1024 * 32)
	benchmarkStackAlloc(1024 * 64)
	benchmarkStackAlloc(1024 * 512)
	benchmarkStackAlloc(1024 * (512 + 64))
	benchmarkStackAlloc(1024 * (512 + 128))
	benchmarkStackAlloc(1024 * (512 + 128 + 64))
	benchmarkStackAlloc(1024 * (512 + 128 + 64 + 32))
	benchmarkStackAlloc(1024 * (512 + 256))
	benchmarkStackAlloc(1024 * 1024 * 1) // 这里 coredump
	benchmarkStackAlloc(1024 * 1024 * 2) //  或者这里 coredump
	benchmarkStackAlloc(1024 * 1024 * 10)
	benchmarkStackAlloc(1024 * 1024 * 100)
	benchmarkStackAlloc(1024 * 1024 * 1000)
}
