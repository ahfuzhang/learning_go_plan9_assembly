package is_const

import (
	"math/rand"
	"testing"
)

// go test -timeout 30s -v -run ^TestIsAConst$ is_const
func TestIsAConst(t *testing.T) {
	arr := []int64{1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1} // 19 x int64
	ret := IsConst(arr)
	if !ret {
		t.Errorf("IsConst(%v) = %v, want %v", arr, ret, true)
		return
	}
	cnt := 1024 * 1024 * 10
	arr2 := getData(cnt)
	ret = IsConst(arr2)
	if !ret {
		t.Errorf("IsConst(%v) = %v, want %v", arr, ret, true)
		return
	}
	arr2[len(arr2)-1] = -1
	ret = IsConst(arr2)
	if ret {
		t.Errorf("should be false")
		return
	}
	//
	arr3 := getData(cnt + 1)
	arr3[len(arr3)-2] = -1
	ret = IsConst(arr3)
	if ret {
		t.Errorf("should be false")
		return
	}
	//
	arr3[len(arr3)-2] = arr3[0]
	arr3[len(arr3)-1] = -2
	ret = IsConst(arr3)
	if ret {
		t.Errorf("should be false")
		return
	}
}

func getData(cnt int) []int64 {
	arr := make([]int64, cnt)
	seed := rand.Int63n(0x7f7f7f7f7f7f7f7f)
	for i := 0; i < cnt; i++ {
		arr[i] = seed
	}
	return arr
}

// go test -benchmem -v -run=^$ -bench ^Benchmark_is_const$ is_const
// 7071.19 MB/s  // 提升 18.5%
// 5761.23 MB/s  // golang version,
func Benchmark_is_const(b *testing.B) {
	cnt := 1024 * 1024 * 10
	arr := getData(cnt)
	b.SetBytes(int64(cnt * 8))
	b.ResetTimer()
	for i := 0; i < b.N; i++ {
		ret := IsConst(arr)
		if !ret {
			b.Fatalf("ret=%v", ret)
		}
	}
}
