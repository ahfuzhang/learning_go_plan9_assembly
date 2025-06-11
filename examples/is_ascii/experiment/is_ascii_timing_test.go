package experiment

import (
	"fmt"
	"math/rand"
	"testing"
	"unsafe"
)

func getRandomString(strLen int) string {
	buf := make([]byte, strLen)
	for i := 0; i < strLen; i++ {
		buf[i] = byte(rand.Intn(128)) // 0-127
	}
	return unsafe.String(&buf[0], strLen)
}

/*
go test -benchmem -run=^$ -bench ^Benchmark_is_ascii$ -benchtime=5000x is_ascii/experiment
// arm64: 1903.48 MB/s
// linux, amd64, Intel(R) Xeon(R) Platinum 8260 CPU @ 2.40GHz:  942.43 MB/s
*/
func Benchmark_is_ascii(b *testing.B) {
	strLen := 1024 * 1024
	s := getRandomString(strLen)
	s = s[9:]
	b.SetBytes(int64(strLen))
	b.ResetTimer()
	for i := 0; i < b.N; i++ {
		ret := IsASCII(s)
		if !ret {
			b.Fatalf("ret=%v", ret)
		}
	}
}

/*
go test -benchmem -run=^$ -bench ^Benchmark_is_ascii_v2$ -benchtime=5000x is_ascii/experiment
// arm64: 19603.24 MB/s
// linux, amd64, Intel(R) Xeon(R) Platinum 8260 CPU @ 2.40GHz:  10915.59 MB/s
*/
func Benchmark_is_ascii_v2(b *testing.B) {
	strLen := 1024 * 1024
	s := getRandomString(strLen)
	s = s[9:]
	b.SetBytes(int64(strLen))
	b.ResetTimer()
	for i := 0; i < b.N; i++ {
		ret := IsASCII_v2(s)
		if !ret {
			b.Fatalf("ret=%v", ret)
		}
	}
}

/*
go test -benchmem -run=^$ -bench ^Benchmark_is_ascii_v3$ -benchtime=5000x is_ascii/experiment
// arm64: 19603.24 MB/s
// linux, amd64, Intel(R) Xeon(R) Platinum 8260 CPU @ 2.40GHz:  11399.17 MB/s
*/
func Benchmark_is_ascii_v3(b *testing.B) {
	strLen := 1024 * 1024
	s := getRandomString(strLen)
	s = s[9:]
	b.SetBytes(int64(strLen))
	b.ResetTimer()
	for i := 0; i < b.N; i++ {
		ret := IsASCII_v3(s)
		if !ret {
			b.Fatalf("ret=%v", ret)
		}
	}
}

/*
go test -benchmem -run=^$ -bench ^Benchmark_is_ascii_v4$ -benchtime=5000x is_ascii/experiment
// arm64: 19603.24 MB/s
// linux, amd64, Intel(R) Xeon(R) Platinum 8260 CPU @ 2.40GHz:  20435.77 MB/s
// todo: arm64 下可能会很明显
*/
func Benchmark_is_ascii_v4(b *testing.B) {
	strLen := 1024 * 1024
	s := getRandomString(strLen)
	s = s[9:]
	b.SetBytes(int64(strLen))
	b.ResetTimer()
	for i := 0; i < b.N; i++ {
		ret := IsASCII_v4(s)
		if !ret {
			b.Fatalf("ret=%v", ret)
		}
	}
}

/*
go test -benchmem -run=^$ -bench ^Benchmark_is_ascii_v5$ -benchtime=5000x is_ascii/experiment
// arm64:
// linux, amd64, Intel(R) Xeon(R) Platinum 8260 CPU @ 2.40GHz:  19573.08 MB/s, ??? 为什么是负优化
// todo: arm64 下可能会很明显

/home/fuchun.zhang/go1.24.4/go/bin/go test -benchmem -run=^$ -bench ^Benchmark_is_ascii_v5$ -benchtime=5000x is_ascii/experiment
*/
func Benchmark_is_ascii_v5(b *testing.B) {
	strLen := 1024 * 1024
	s := getRandomString(strLen)
	s = s[9:]
	b.SetBytes(int64(strLen))
	b.ResetTimer()
	for i := 0; i < b.N; i++ {
		ret := IsASCII_v5(s)
		if !ret {
			b.Fatalf("ret=%v", ret)
		}
	}
}

/*
go test -benchmem -run=^$ -bench ^Benchmark_is_ascii_v6$ -benchtime=5000x is_ascii/experiment
// arm64:
// linux, amd64, Intel(R) Xeon(R) Platinum 8260 CPU @ 2.40GHz:  19573.08 MB/s, ??? 为什么是负优化
// todo: arm64 下可能会很明显

/home/fuchun.zhang/go1.24.4/go/bin/go test -benchmem -run=^$ -bench ^Benchmark_is_ascii_v6$ -benchtime=5000x is_ascii/experiment
*/
func Benchmark_is_ascii_v6(b *testing.B) {
	strLen := 1024 * 1024
	s := getRandomString(strLen)
	s = s[9:]
	b.SetBytes(int64(strLen))
	b.ResetTimer()
	for i := 0; i < b.N; i++ {
		ret := IsASCII_v6(s)
		if !ret {
			b.Fatalf("ret=%v", ret)
		}
	}
}

/*
go test -benchmem -run=^$ -bench ^Benchmark_is_ascii_v7$ -benchtime=5000x is_ascii/experiment
// arm64 54100.46 MB/s
*/
func Benchmark_is_ascii_v7(b *testing.B) {
	strLen := 1024 * 1024
	s := getRandomString(strLen)
	s = s[9:]
	b.SetBytes(int64(strLen))
	b.ResetTimer()
	for i := 0; i < b.N; i++ {
		ret := IsASCII_v7(s)
		if !ret {
			b.Fatalf("ret=%v", ret)
		}
	}
}

/*
go test -benchmem -run=^$ -bench ^Benchmark_is_ascii_v8$ -benchtime=5000x is_ascii/experiment
// arm64 54100.46 MB/s
*/
func Benchmark_is_ascii_v8(b *testing.B) {
	strLen := 1024 * 1024
	s := getRandomString(strLen)
	s = s[9:]
	b.SetBytes(int64(strLen))
	b.ResetTimer()
	for i := 0; i < b.N; i++ {
		ret := IsASCII_v8(s)
		if !ret {
			b.Fatalf("ret=%v", ret)
		}
	}
}

/*
go test -benchmem -run=^$ -bench ^Benchmark_is_ascii_len_less_8$ -benchtime=20000x is_ascii/experiment
go test -benchmem -run=^$ -bench ^Benchmark_is_ascii_len_less_8$ is_ascii/experiment
goos: linux
goarch: amd64
pkg: is_ascii/experiment
cpu: Intel(R) Xeon(R) Platinum 8457C

697.84 MB/s
1139.98 MB/s
*/
func Benchmark_is_ascii_len_less_8(b *testing.B) {
	strLen := 16
	s := getRandomString(strLen)
	s = s[rand.Int63n(8):]
	//s = s[:rand.Int63n(7)+1]
	//
	f := func(l int) {
		b.Run(fmt.Sprintf("IsASCII_%d", l), func(b *testing.B) {
			b.SetBytes(int64(l))
			b.ResetTimer()
			for i := 0; i < b.N; i++ {
				ret := IsASCII(s[:l])
				if !ret {
					b.Fatalf("ret=%v", ret)
				}
			}
		})
		b.Run(fmt.Sprintf("isAsciiForLenLess8_%d", l), func(b *testing.B) {
			b.SetBytes(int64(l))
			b.ResetTimer()
			for i := 0; i < b.N; i++ {
				ret := isAsciiForLenLess8(s[:l])
				if (ret & maskOfAscii) != 0 {
					b.Fatalf("ret=%v", ret)
				}
			}
		})
		b.Run(fmt.Sprintf("isAsciiForLenLess8_v4_%d", l), func(b *testing.B) {
			b.SetBytes(int64(l))
			b.ResetTimer()
			ptr := unsafe.Pointer(unsafe.StringData(s))
			for i := 0; i < b.N; i++ {
				ret := isAsciiForLenLess8_v4(ptr, l)
				if (ret & maskOfAscii) != 0 {
					b.Fatalf("ret=%v", ret)
				}
			}
		})
	}
	f(1)
	f(2)
	f(3)
	f(4)
	f(5)
	f(6)
	f(7)
}

type IsASCIIFunc func(s string) bool

/*
go test -benchmem -run=^$ -bench ^Benchmark_is_ascii_long$ -benchtime=20000x is_ascii/experiment
go test -benchmem -run=^$ -bench ^Benchmark_is_ascii_long$ is_ascii/experiment
goos: linux
goarch: amd64
pkg: is_ascii/experiment
cpu: Intel(R) Xeon(R) Platinum 8457C

697.84 MB/s
1139.98 MB/s
*/
func Benchmark_is_ascii_long(b *testing.B) {
	strLen := 1024 * 1024
	s := getRandomString(strLen)
	//s = s[rand.Int63n(63)+1:] // 造成随机的不对齐
	s = s[3:]
	funcs := []IsASCIIFunc{IsASCII, IsASCII_v2, IsASCII_v3, IsASCII_v4, IsASCII_v5, IsASCII_v6, IsASCII_v7, IsASCII_v8, IsASCII_v9, IsASCII_v10, IsASCII_v11, IsASCII_v12}

	f := func(v int) {
		b.Run(fmt.Sprintf("IsASCII_v%d", v), func(b *testing.B) {
			b.SetBytes(int64(len(s)))
			b.ResetTimer()
			for i := 0; i < b.N; i++ {
				ret := funcs[v-1](s)
				if !ret {
					b.Fatalf("ret=%v", ret)
				}
			}
		})
	}
	f(1) // version 1
	f(2)
	f(3)
	f(4)
	f(5)
	f(6)
	f(7)
	//f(8)
	f(9)
	f(10)
	//f(11) // 43473.41 MB/s
	f(12)
}

/*
go test -benchmem -run=^$ -bench ^Benchmark_is_ascii_short$ -benchtime=20000x is_ascii/experiment
go test -benchmem -run=^$ -bench ^Benchmark_is_ascii_short$ is_ascii/experiment
goos: linux
goarch: amd64
pkg: is_ascii/experiment
cpu: Intel(R) Xeon(R) Platinum 8457C

697.84 MB/s
1139.98 MB/s
*/
func Benchmark_is_ascii_short(b *testing.B) {
	strLen := 1024 * 1024
	s := getRandomString(strLen)
	s = s[rand.Int63n(63)+1:] // 造成随机的不对齐
	funcs := []IsASCIIFunc{IsASCII, IsASCII_v2, IsASCII_v3, IsASCII_v4, IsASCII_v5, IsASCII_v6, IsASCII_v7, IsASCII_v8, IsASCII_v9, IsASCII_v10, IsASCII_v11, IsASCII_v12}

	f := func(v int) {
		b.Run(fmt.Sprintf("IsASCII_v%d", v), func(b *testing.B) {
			s = s[:63]
			b.SetBytes(int64(len(s)))
			b.ResetTimer()
			for i := 0; i < b.N; i++ {
				ret := funcs[v-1](s)
				if !ret {
					b.Fatalf("ret=%v", ret)
				}
			}
		})
	}
	f(1) // version 1
	// f(2)
	// f(3)
	// f(4)
	// f(5)
	// f(6)
	// f(7)
	//f(8)
	f(9)
	f(10)
	f(12)
}

func Test_IsAscii_v12(t *testing.T) {
	l := 63
	s := getRandomString(l)
	for i := 0; i < 64; i++ {
		if !IsASCII_v12(s[:i]) {
			t.Errorf("len=%d, should be true", i)
			return
		}
	}
	arr := unsafe.Slice(unsafe.StringData(s), len(s))
	for i := 1; i < 64; i++ {
		old := arr[i-1]
		arr[i-1] = 0xff
		if IsASCII_v12(s) {
			t.Errorf("loc=%d, should be false", i)
			return
		}
		arr[i-1] = old
	}
	for i := 1; i < 64; i++ {
		old := arr[i-1]
		arr[i-1] = 0xff
		if IsASCII_v12(s[:i]) {
			t.Errorf("loc=%d, should be false", i)
			return
		}
		arr[i-1] = old
	}
	// 超过 64 字节
	l = 63 + 1024
	s = getRandomString(l)
	s = s[5:]
	for i := 0; i < 64; i++ {
		if !IsASCII_v12(s[i:]) {
			t.Errorf("len=%d, should be true", i)
			return
		}
	}
	arr = unsafe.Slice(unsafe.StringData(s), len(s))
	for i := 1; i <= 10; i++ {
		old := arr[i*64-1]
		arr[i*64-1] = 0xff
		if IsASCII_v12(s) {
			t.Errorf("loc=%d, should be false", i)
			return
		}
		arr[i*64-1] = old
	}
	//
	l = 63 + 1024
	s = getRandomString(l)
	addr := uint64(uintptr(unsafe.Pointer(unsafe.StringData(s))))
	t.Logf("%016x\n", addr)
	headLen := 64 - addr&63
	if headLen != 0 {
		s = s[headLen:]
	}
	if !IsASCII_v12(s) {
		t.Errorf("head len error")
	}
}
