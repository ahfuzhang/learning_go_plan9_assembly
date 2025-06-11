package movemask

import (
	"testing"
	"unsafe"
)

// go test -v -timeout 30s -run ^Test_mm_movemask_epi8$ movemask
// dlv test -- -test.v -test.timeout 30s -test.run ^Test_mm_movemask_epi8$
func Test_mm_movemask_epi8(t *testing.T) {
	var ret uint16
	var buf [16]uint8
	ptr := uint64(uintptr(unsafe.Pointer(&buf[0])))
	for i := 0; i < 65536; i++ {
		fill(uint16(i), buf[:16])
		ret = _mm_movemask_epi8(ptr)
		if ret != uint16(i) {
			t.Errorf("error:%d, got:%d, buf=%+v", i, ret, buf[:16])
			return
		}
	}
}

func fill(v uint16, out []byte) {
	for i := 0; i < 16; i++ {
		bit := (v >> i) & 1
		if bit == 1 {
			out[i] = 0xff
		} else {
			out[i] = 0x00
		}
	}
}
