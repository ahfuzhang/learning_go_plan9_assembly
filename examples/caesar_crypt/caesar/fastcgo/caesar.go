package fastcgo

/*
#include "caesar.h"
#include "caesar_avx2.h"
#include "caesar_avx512.h"
*/
import "C"
import (
	"caesar_crypt/caesar/golang"
	"unsafe"

	unsafecall "github.com/petermattis/fastcgo"
)

// CaesarCryptByFastCgo
func CaesarCryptByFastCgo(out []byte, in []byte, rotate int) {
	unsafecall.UnsafeCall4(C.caesar_crypt,
		uint64(uintptr(unsafe.Pointer(&out))),
		uint64(uintptr(unsafe.Pointer(&in))),
		uint64(rotate),
		uint64(uintptr(unsafe.Pointer(golang.GetTable()))),
	)
}

// CaesarCryptByFastCgoAvx2
func CaesarCryptByFastCgoAvx2(out []byte, in []byte, rotate int) {
	unsafecall.UnsafeCall4(C.caesar_crypt_avx2,
		uint64(uintptr(unsafe.Pointer(&out))),
		uint64(uintptr(unsafe.Pointer(&in))),
		uint64(rotate),
		uint64(uintptr(unsafe.Pointer(golang.GetTable()))),
	)
}

// CaesarCryptByFastCgoAvx512
func CaesarCryptByFastCgoAvx512(out []byte, in []byte, rotate int) {
	unsafecall.UnsafeCall4(C.caesar_crypt_avx512,
		uint64(uintptr(unsafe.Pointer(&out))),
		uint64(uintptr(unsafe.Pointer(&in))),
		uint64(rotate),
		uint64(uintptr(unsafe.Pointer(golang.GetTable()))),
	)
}
