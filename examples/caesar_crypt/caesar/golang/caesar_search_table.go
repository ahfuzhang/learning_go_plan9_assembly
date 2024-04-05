package golang

import (
	"unsafe"
)

type CaesarTable [26][256]uint32

var (
	// 为 256 个  ascii 字符都建立一个映射表
	// 为  26 个字母的每一种变化都建立映射表
	tableOfCaesar CaesarTable //  26 * 256 * 4 bytes = 26 kb
)

func init() {
	for i := 0; i < 26; i++ {
		line := &tableOfCaesar[i]
		for j := 0; j < 256; j++ {
			c := byte(j)
			if c >= 'a' && c <= 'z' {
				line[c] = uint32(byte((j-'a'+i)%26 + 'a'))
			} else if c >= 'A' && c <= 'Z' {
				line[c] = uint32(byte((j-'A'+i)%26 + 'A'))
			} else {
				line[c] = uint32(c)
			}
		}
	}
}

// CaesarCryptBySearchTable  查表的方法来得到结果
func CaesarCryptBySearchTable(out []byte, in []byte, rotate int) {
	rotate %= 26
	line := unsafe.Pointer(&tableOfCaesar[rotate][0])
	start := unsafe.Pointer(&in[0])
	end := uintptr(unsafe.Add(start, len(in)))
	target := unsafe.Pointer(&out[0])
	for uintptr(start) < end {
		c := *((*byte)(start))
		*((*byte)(target)) = *(*byte)(unsafe.Add(line, int(c)*4))
		start = unsafe.Add(start, 1)
		target = unsafe.Add(target, 1)
	}
}

// GetTable for test
func GetTable() *CaesarTable {
	return &tableOfCaesar
}
