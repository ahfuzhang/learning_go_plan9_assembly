package pkg

import (
	"testing"
	"unsafe"
)

func TestPrefetchT1(t *testing.T) {
	buf := make([]byte, 1024*4)
	PrefetchT1(uintptr(unsafe.Pointer(&buf[0])), uint64(len(buf)))
}
