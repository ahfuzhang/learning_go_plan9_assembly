package load_256bits

import (
	"math/rand"
	"testing"
)

func getDeltaData(cnt int) []int64 {
	arr := make([]int64, cnt)
	seed := rand.Int63n(0x7f7f7f7f7f7f7f7f)
	for i := 0; i < cnt; i++ {
		arr[i] = seed + int64(i)
	}
	return arr
}

func Test_Load256Bits(t *testing.T) {
	cnt := 1024 * 1024 * 10
	arr := getDeltaData(cnt)
	t.Logf("%+v", Load256Bits(arr))
}

// cd examples/load_256bits/
// go test -v -timeout 30s -run ^Test_Load256Bits_1$ load_256bits
func Test_Load256Bits_1(t *testing.T) {
	arr := []int64{1, 2, 3, 4, 5}
	t.Logf("%+v", Load256Bits(arr))
}

func Test_Set256Bits_1(t *testing.T) {
	arr := []int64{1, 2, 3, 4, 5}
	t.Logf("%+v", Set256Bits(arr))
}
