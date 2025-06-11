package is_ascii

import (
	"math/rand"
	"testing"
	"unicode/utf8"
	"unsafe"
)

const str32 = "12345678901234567890123456789012"
const str32NotAscii = "123456789012345678901234567890\x81\x82"

// go test -timeout 30s -v -run ^TestIsASCII$ is_ascii
func TestIsASCII(t *testing.T) {
	type args struct {
		s string
	}
	tests := []struct {
		name string
		args args
		want bool
	}{
		{
			name: "ascii 1",
			args: args{
				s: "abcdefghijklmnopqrstuvwxyz",
			},
			want: true,
		},
		{
			name: "ascii 2",
			args: args{
				s: str32,
			},
			want: true,
		},
		{
			name: "ascii 3",
			args: args{
				s: str32 + str32,
			},
			want: true,
		},
		{
			name: "ascii 4",
			args: args{
				s: str32 + str32 + "123",
			},
			want: true,
		},
		{
			name: "ascii 5",
			args: args{
				s: "\x7f",
			},
			want: true,
		},
		{
			name: "ascii 5",
			args: args{
				s: "\x80",
			},
			want: false,
		},
		{
			name: "ascii 5",
			args: args{
				s: "中文字符串",
			},
			want: false,
		},
		{
			name: "ascii 6",
			args: args{
				s: str32NotAscii,
			},
			want: false,
		},
		{
			name: "ascii 6",
			args: args{
				s: str32 + str32NotAscii + "123",
			},
			want: false,
		},
	}
	for _, tt := range tests {
		t.Run(tt.name, func(t *testing.T) {
			if got := IsASCII(tt.args.s); got != tt.want {
				t.Errorf("IsASCII() = %v, want %v", got, tt.want)
			}
		})
	}
}

func getRandomString(strLen int) string {
	buf := make([]byte, strLen)
	for i := 0; i < strLen; i++ {
		buf[i] = byte(rand.Intn(128)) // 0-127
	}
	return unsafe.String(&buf[0], strLen)
}

// go test -benchmem -v -run=^$ -bench ^Benchmark_is_ascii$ is_ascii
// 913.11 MB/s
// 34335.78 MB/s simd version
// linux, amd64, 3.1GHz, 64138.16 MB/s  对齐
//
//	不对齐版本 47965.72 MB/s
func Benchmark_is_ascii(b *testing.B) {
	strLen := 1024 * 1024
	s := getRandomString(strLen)
	s = s[3:]
	b.SetBytes(int64(len(s)))
	b.ResetTimer()
	for i := 0; i < b.N; i++ {
		ret := IsASCII(s)
		if !ret {
			b.Fatalf("ret=%v", ret)
		}
	}
}

func IsASCII_one_by_one(s string) bool {
	for i := range s {
		if s[i] >= utf8.RuneSelf {
			return false
		}
	}
	return true
}

//
// 674.37 MB/s
// go test -benchmem -v -run=^$ -bench ^Benchmark_is_ascii_one_by_one$ is_ascii
/*
goos: linux
goarch: amd64
pkg: is_ascii
cpu: Intel(R) Xeon(R) Platinum 8260 CPU @ 2.40GHz
// linux, amd64, 3.1GHz, 1143.86 MB/s
*/
func Benchmark_is_ascii_one_by_one(b *testing.B) {
	strLen := 1024 * 1024
	s := getRandomString(strLen)
	s = s[3:]
	b.SetBytes(int64(len(s)))
	b.ResetTimer()
	for i := 0; i < b.N; i++ {
		ret := IsASCII_one_by_one(s)
		if !ret {
			b.Fatalf("ret=%v", ret)
		}
	}
}
