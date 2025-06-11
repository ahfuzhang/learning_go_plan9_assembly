package is_sorted

import "testing"

// go test -benchmem -v -run=^$ -bench ^Benchmark_is_sorted$ is_sorted
/*
goos: linux
goarch: amd64
pkg: is_sorted
cpu: Intel(R) Xeon(R) Platinum 8260 CPU @ 2.40GHz
Benchmark_is_sorted
Benchmark_is_sorted-8                100          13194847 ns/op        6357.49 MB/s           0 B/op          0 allocs/op

golang version: 5215.02 MB/s
17.97% faster

go test -benchmem -v -run=^$ -bench ^Benchmark_is_sorted$ -benchtime=1000x is_sorted
// go 1.22, amd64, 2.4GHz, 6261.97 MB/s

/home/fuchun.zhang/go1.24.4/go/bin/go test -benchmem -v -run=^$ -bench ^Benchmark_is_sorted$ -benchtime=1000x is_sorted
// go 1.24.4, amd64, 2.4GHz, 6438.69 MB/s
*/
func Benchmark_is_sorted(b *testing.B) {
	cnt := 1024 * 1024 * 10
	arr := getDeltaData(cnt)
	b.SetBytes(int64(cnt * 8))
	b.ResetTimer()
	for i := 0; i < b.N; i++ {
		ret := IsSorted(arr)
		if !ret {
			b.Fatalf("ret=%v", ret)
		}
	}
}
