package is_sorted

import (
	"math/rand"
	"testing"
)

func isSorted(a []int64) bool {
	for i := range a {
		if i > 0 && a[i] < a[i-1] {
			return false
		}
	}
	return true
}

// go test -timeout 30s -v -run ^Test_is_sorted$ is_sorted
// dlv test -- -test.v -test.run ^Test_is_sorted$
func Test_is_sorted(t *testing.T) {
	f := func(a []int64, expect bool) {
		if IsSorted3(a) != expect {
			t.Errorf("%+v should be %v", a, expect)
		}
	}

	f([]int64{1, 2, 3, 4, 6, 7, 8, 9, 9}, true)
	f([]int64{}, true)
	f([]int64{1}, true)
	f([]int64{1, 2}, true)
	f([]int64{1, 3}, true)
	f([]int64{1, 2, 3, 4}, true)
	f([]int64{1, 2, 3, 4, 5}, true)
	f([]int64{1, 2, 3, 4, 6}, true)
	f([]int64{1, 2, 3, 4, 6, 7, 8}, true)
	f([]int64{1, 2, 3, 4, 6, 7, 8, 9}, true)

	f([]int64{1, 2, 3, 4, 6, 7, 8, 9, 9, 8}, false)
	f([]int64{-4, -3, -2, -1, 0, 1, 2, 3, 4, 6, 7, 8, 9, 9}, true)
	//
	cnt := 1024 * 1024 * 10
	arr := getDeltaData(cnt)
	f(arr, true)
}

func getDeltaData(cnt int) []int64 {
	arr := make([]int64, cnt)
	seed := rand.Int63n(0x7f7f7f7f7f7f7f7f)
	for i := 0; i < cnt; i++ {
		arr[i] = seed + int64(i)
	}
	return arr
}

// go test -benchmem -v -run=^$ -bench ^Benchmark_is_sorted_slow$ is_sorted
/*
goos: linux
goarch: amd64
pkg: is_sorted
cpu: Intel(R) Xeon(R) Platinum 8260 CPU @ 2.40GHz
Benchmark_is_sorted_slow
Benchmark_is_sorted_slow-8            74          16085474 ns/op        5215.02 MB/s           0 B/op          0 allocs/op

arm64: 19176.94 MB/s

go test -benchmem -v -run=^$ -bench ^Benchmark_is_sorted_slow$ -benchtime=1000x is_sorted
// go 1.22, amd64, 2.4GHz, 4961.00 MB/s
// arm64: 19720.66 MB/s

/home/fuchun.zhang/go1.24.4/go/bin/go test -benchmem -v -run=^$ -bench ^Benchmark_is_sorted_slow$ -benchtime=1000x is_sorted
// go 1.24.4, amd64, 2.4GHz, 5185.20 MB/s
*/
func Benchmark_is_sorted_slow(b *testing.B) {
	cnt := 1024 * 1024 * 10
	arr := getDeltaData(cnt)
	b.SetBytes(int64(cnt * 8))
	b.ResetTimer()
	for i := 0; i < b.N; i++ {
		ret := isSorted(arr)
		if !ret {
			b.Fatalf("ret=%v", ret)
		}
	}
}

// 4815.42 MB/s
// arm64: 39170.33 MB/s
/*
go test -benchmem -v -run=^$ -bench ^Benchmark_is_sorted_v2$ -benchtime=1000x is_sorted
// go 1.22, amd64, 2.4GHz, 4729.95 MB/s

/home/fuchun.zhang/go1.24.4/go/bin/go test -benchmem -v -run=^$ -bench ^Benchmark_is_sorted_v2$ -benchtime=1000x is_sorted
// go 1.24.4, amd64, 2.4GHz, 4788.65 MB/s
*/
func Benchmark_is_sorted_v2(b *testing.B) {
	cnt := 1024 * 1024 * 10
	arr := getDeltaData(cnt)
	b.SetBytes(int64(cnt * 8))
	b.ResetTimer()
	for i := 0; i < b.N; i++ {
		ret := IsSorted2(arr)
		if !ret {
			b.Fatalf("ret=%v", ret)
		}
	}
}

/*
go test -benchmem -v -run=^$ -bench ^Benchmark_is_sorted_v3$ -benchtime=1000x is_sorted
// arm64 11463.82 MB/s  // 这是最慢的一版
// arm64  18566.43 MB/s,  不准确，但是指令更少的版本

go test -benchmem -v -run=^$ -bench ^Benchmark_is_sorted_v3$ -benchtime=1000x is_sorted
// go 1.22, amd64, 2.4GHz, 3201.94 MB/s
*/
func Benchmark_is_sorted_v3(b *testing.B) {
	cnt := 1024 * 1024 * 10
	arr := getDeltaData(cnt)
	b.SetBytes(int64(cnt * 8))
	b.ResetTimer()
	for i := 0; i < b.N; i++ {
		ret := IsSorted3(arr)
		if !ret {
			b.Fatalf("ret=%v", ret)
		}
	}
}

/*
go test -benchmem -v -run=^$ -bench ^Benchmark_is_sorted_v4$ -benchtime=1000x is_sorted
4135.45 MB/s

/home/fuchun.zhang/go1.24.4/go/bin/go test -benchmem -v -run=^$ -bench ^Benchmark_is_sorted_v4$ -benchtime=1000x is_sorted
// go 1.24.4, amd64, 2.4GHz, 4009.01 MB/s
*/
func Benchmark_is_sorted_v_4(b *testing.B) {
	cnt := 1024 * 1024 * 10
	arr := getDeltaData(cnt)
	b.SetBytes(int64(cnt * 8))
	b.ResetTimer()
	for i := 0; i < b.N; i++ {
		ret := IsSorted4(arr)
		if !ret {
			b.Fatalf("ret=%v", ret)
		}
	}
}

const (
	MaxInt64 = 1<<63 - 1
	MinInt64 = -1 << 63
)

func Test_is_less_equal(t *testing.T) {
	f := func(a, b int64, expect bool) {
		ret := isLessEqual(a, b) != 0
		if ret != expect {
			t.Errorf("%v <= %v should be %v", a, b, expect)
		}
	}
	f(0, 0, true)
	f(-1, -1, true)
	f(-2, -1, true)
	f(1, 1, true)
	f(0, 1, true)
	f(-1, 0, true)
	f(-1, 1, true)
	f(1, 0, false)
	f(1, -1, false)
	f(0, -1, false)
	f(MinInt64, 0, true)
	f(MinInt64, MaxInt64, true)
	f(0, MaxInt64, true)
	f(0, MinInt64, false)
	f(MaxInt64, MinInt64, false)
	f(MaxInt64, 0, false)
}

func Test_is_less_equal_0(t *testing.T) {
	f := func(a, b int64, expect bool) {
		ret := isLessEqual0(a, b) != 0
		if ret != expect {
			t.Errorf("%v <= %v should be %v", a, b, expect)
		}
	}
	f(0, 0, true)
	f(-1, -1, true)
	f(-2, -1, true)
	f(1, 1, true)
	f(0, 1, true)
	f(-1, 0, true)
	f(-1, 1, true)
	f(1, 0, false)
	f(1, -1, false)
	f(0, -1, false)
	// f(MinInt64, 0, true)
	// f(MinInt64, MaxInt64, true)
	f(0, MaxInt64, true)
	f(MaxInt64-1, MaxInt64, true)
	f(0, MaxInt64-1, true)
	// f(0, MinInt64, false)
	// f(MaxInt64, MinInt64, false)
	f(MaxInt64, 0, false)
	//f(MaxInt64, -1, false)
	f(MaxInt64, MaxInt64-1, false)
}

func Test_isGreaterForTimestamp(t *testing.T) {
	f := func(a, b int64, expect bool) {
		ret := isGreaterForTimestamp(a, b) != 0
		if ret != expect {
			t.Errorf("%v <= %v should be %v", a, b, expect)
		}
	}
	f(0, 0, false)
	f(1, 1, false)
	f(0, 1, false)
	f(1, 0, true)
	f(MaxInt64, MaxInt64-1, true)
	f(0, MaxInt64, false)
	f(MaxInt64-1, MaxInt64, false)
	f(MaxInt64, 0, true)
}

func Test_is_sorted_v4(t *testing.T) {
	f := func(a []int64, expect bool) {
		if IsSorted4(a) != expect {
			t.Errorf("%+v should be %v", a, expect)
		}
	}

	f([]int64{1, 2, 3, 4, 6, 7, 8, 9, 9}, true)
	f([]int64{}, true)
	f([]int64{1}, true)
	f([]int64{1, 2}, true)
	f([]int64{1, 3}, true)
	f([]int64{1, 2, 3, 4}, true)
	f([]int64{1, 2, 3, 4, 5}, true)
	f([]int64{1, 2, 3, 4, 6}, true)
	f([]int64{1, 2, 3, 4, 6, 7, 8}, true)
	f([]int64{1, 2, 3, 4, 6, 7, 8, 9}, true)

	f([]int64{1, 2, 3, 4, 6, 7, 8, 9, 9, 8}, false)
	//f([]int64{-4, -3, -2, -1, 0, 1, 2, 3, 4, 6, 7, 8, 9, 9}, true)
	//
	cnt := 1024 * 1024 * 10
	arr := getDeltaData(cnt)
	f(arr, true)
}

/*
go test -benchmem -v -run=^$ -bench ^Benchmark_is_sorted_v4$ -benchtime=1000x is_sorted
// go 1.22, amd64, 2.4GHz, 5066.66 MB/s,
// 性能提升:  (5066.66-4926.67)/5066.66 = 2.76%

/home/fuchun.zhang/go1.24.4/go/bin/go test -benchmem -v -run=^$ -bench ^Benchmark_is_sorted_v4$ -benchtime=1000x is_sorted
// go 1.24.4, amd64, 2.4GHz, 5228.71 MB/s

// arm64 37208.42 MB/s   40097.05 MB/s
*/
func Benchmark_is_sorted_v4(b *testing.B) {
	cnt := 1024 * 1024 * 10
	arr := getDeltaData(cnt)
	b.SetBytes(int64(cnt * 8))
	b.ResetTimer()
	for i := 0; i < b.N; i++ {
		ret := IsSorted4(arr)
		if !ret {
			b.Fatalf("ret=%v", ret)
		}
	}
}
