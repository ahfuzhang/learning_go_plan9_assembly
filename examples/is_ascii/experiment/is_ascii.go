package experiment

import (
	"unicode/utf8"
	"unsafe"
)

func IsASCII(s string) bool {
	for i := range s {
		if s[i] >= utf8.RuneSelf {
			return false
		}
	}
	return true
}

const maskOfAscii uint64 = uint64(0x8080808080808080)

func IsASCII_v2(s string) bool {
	l := len(s)
	align8 := l & (-8)
	buf := unsafe.Slice(unsafe.StringData(s), align8)
	for i := 0; i < align8; i += 8 {
		var v uint64 = *((*uint64)(unsafe.Pointer(&buf[i])))
		if (v & maskOfAscii) != 0 {
			return false
		}
	}
	s = s[align8:]
	for i := range s {
		if s[i] >= utf8.RuneSelf {
			return false
		}
	}
	return true
}

func IsASCII_v3(s string) bool {
	l := len(s)
	align8 := l & (-8)
	//buf := unsafe.Slice(unsafe.StringData(s),  align8)
	ptr := unsafe.Pointer(unsafe.StringData(s))
	for i := 0; i < align8; i += 8 {
		var v uint64 = *((*uint64)(unsafe.Add(ptr, i)))
		if (v & maskOfAscii) != 0 {
			return false
		}
	}
	ptr = unsafe.Add(ptr, align8)
	//s = unsafe.String((*byte)(ptr), l&7)
	//for i := range s {
	for i := 0; i < l&7; i++ {
		var c byte = *((*byte)(unsafe.Add(ptr, i)))
		if c >= utf8.RuneSelf {
			return false
		}
	}
	return true
}

func IsASCII_v4(s string) bool {
	l := len(s)
	align64 := l & (-64)
	//buf := unsafe.Slice(unsafe.StringData(s), align8)
	ptr := unsafe.Pointer(unsafe.StringData(s))
	for i := 0; i < align64; i += 64 {
		values := ((*[8]uint64)(unsafe.Add(ptr, i)))
		if (values[0]&maskOfAscii) != 0 ||
			(values[1]&maskOfAscii) != 0 ||
			(values[2]&maskOfAscii) != 0 ||
			(values[3]&maskOfAscii) != 0 ||
			(values[4]&maskOfAscii) != 0 ||
			(values[5]&maskOfAscii) != 0 ||
			(values[6]&maskOfAscii) != 0 ||
			(values[7]&maskOfAscii) != 0 {
			return false
		}
	}
	ptr = unsafe.Add(ptr, align64)
	//s = unsafe.String((*byte)(ptr), l&7)
	for i := 0; i < l&63; i++ {
		var c byte = *((*byte)(unsafe.Add(ptr, i)))
		if c >= utf8.RuneSelf {
			return false
		}
	}
	return true
}

func IsASCII_v5(s string) bool {
	l := len(s)
	align64 := l & (-64)
	//buf := unsafe.Slice(unsafe.StringData(s), align8)
	ptr := unsafe.Pointer(unsafe.StringData(s))
	for i := 0; i < align64; i += 64 {
		values := ((*[8]uint64)(unsafe.Add(ptr, i)))
		a := values[0]
		b := values[1]
		c := values[2]
		d := values[3]
		e := values[4]
		f := values[5]
		g := values[6]
		h := values[7]
		// bits := ((a & maskOfAscii) |
		// 	(b & maskOfAscii) |
		// 	(c & maskOfAscii) |
		// 	(d & maskOfAscii) |
		// 	(e & maskOfAscii) |
		// 	(f & maskOfAscii) |
		// 	(g & maskOfAscii) |
		// 	(h & maskOfAscii))
		bits := (a | b | c | d | e | f | g | h) & maskOfAscii
		if bits != 0 { // 一定要加括号，否则优先级有问题
			return false
		}
	}
	ptr = unsafe.Add(ptr, align64)
	//s = unsafe.String((*byte)(ptr), l&7)
	for i := 0; i < l&63; i++ {
		var c byte = *((*byte)(unsafe.Add(ptr, i)))
		if c >= utf8.RuneSelf {
			return false
		}
	}
	return true
}

func IsASCII_v6(s string) bool {
	addr := uint64(uintptr(unsafe.Pointer(unsafe.StringData(s))))
	alignAddr := (addr + uint64(63)) & (^uint64(63))
	headLen := alignAddr - addr
	ptr := unsafe.Pointer(unsafe.StringData(s))
	for i := 0; i < int(headLen); i++ {
		var c byte = *((*byte)(unsafe.Add(ptr, i)))
		if c >= utf8.RuneSelf {
			return false
		}
	}
	l := len(s) - int(headLen)
	align64 := l & (-64)
	ptr = unsafe.Add(ptr, headLen)
	//buf := unsafe.Slice(unsafe.StringData(s), align8)
	for i := 0; i < align64; i += 64 {
		values := ((*[8]uint64)(unsafe.Add(ptr, i)))
		a := values[0]
		b := values[1]
		c := values[2]
		d := values[3]
		e := values[4]
		f := values[5]
		g := values[6]
		h := values[7]
		// bits := ((a & maskOfAscii) |
		// 	(b & maskOfAscii) |
		// 	(c & maskOfAscii) |
		// 	(d & maskOfAscii) |
		// 	(e & maskOfAscii) |
		// 	(f & maskOfAscii) |
		// 	(g & maskOfAscii) |
		// 	(h & maskOfAscii))
		bits := (a | b | c | d | e | f | g | h) & maskOfAscii
		if bits != 0 { // 一定要加括号，否则优先级有问题
			return false
		}
	}
	ptr = unsafe.Add(ptr, align64)
	//s = unsafe.String((*byte)(ptr), l&7)
	for i := 0; i < l&63; i++ {
		var c byte = *((*byte)(unsafe.Add(ptr, i)))
		if c >= utf8.RuneSelf {
			return false
		}
	}
	return true
}

func IsASCII_v7(s string) bool {
	ptr := unsafe.Pointer(unsafe.StringData(s))
	addr := uint64(uintptr(ptr))
	alignAddr := (addr + uint64(63)) & (^uint64(63))
	headLen := alignAddr - addr
	for i := 0; i < int(headLen); i++ {
		var c byte = *((*byte)(unsafe.Add(ptr, i)))
		if c >= utf8.RuneSelf {
			return false
		}
	}
	l := len(s) - int(headLen)
	align64 := l & (-64)
	ptr = unsafe.Add(ptr, headLen)
	//buf := unsafe.Slice(unsafe.StringData(s), align8)
	for i := 0; i < align64; i += 64 {
		values := ((*[8]uint64)(unsafe.Add(ptr, i)))
		if (values[0]&maskOfAscii) != 0 ||
			(values[1]&maskOfAscii) != 0 ||
			(values[2]&maskOfAscii) != 0 ||
			(values[3]&maskOfAscii) != 0 ||
			(values[4]&maskOfAscii) != 0 ||
			(values[5]&maskOfAscii) != 0 ||
			(values[6]&maskOfAscii) != 0 ||
			(values[7]&maskOfAscii) != 0 {
			return false
		}
	}
	ptr = unsafe.Add(ptr, align64)
	//s = unsafe.String((*byte)(ptr), l&7)
	for i := 0; i < l&63; i++ {
		var c byte = *((*byte)(unsafe.Add(ptr, i)))
		if c >= utf8.RuneSelf {
			return false
		}
	}
	return true
}

func IsASCII_v8(s string) bool {
	addr := uint64(uintptr(unsafe.Pointer(unsafe.StringData(s))))
	alignAddr := (addr + uint64(63)) & (^uint64(63))
	headLen := alignAddr - addr
	ptr := unsafe.Pointer(unsafe.StringData(s))
	for i := 0; i < int(headLen); i++ {
		var c byte = *((*byte)(unsafe.Add(ptr, i)))
		if c >= utf8.RuneSelf {
			return false
		}
	}
	l := len(s) - int(headLen)
	align64 := l & (-64)
	ptr = unsafe.Add(ptr, headLen)
	//buf := unsafe.Slice(unsafe.StringData(s), align8)
	for i := 0; i < align64; i += 64 {
		values := ((*[8]uint64)(unsafe.Add(ptr, i)))
		if (values[0]&maskOfAscii) != 0 ||
			(values[1]&maskOfAscii) != 0 ||
			(values[2]&maskOfAscii) != 0 ||
			(values[3]&maskOfAscii) != 0 ||
			(values[4]&maskOfAscii) != 0 ||
			(values[5]&maskOfAscii) != 0 ||
			(values[6]&maskOfAscii) != 0 ||
			(values[7]&maskOfAscii) != 0 {
			return false
		}
	}
	// align8
	ptr = unsafe.Add(ptr, align64)
	l -= align64
	align8 := l & (-8)
	for i := 0; i < align8; i += 8 {
		var v uint64 = *((*uint64)(unsafe.Add(ptr, i)))
		if (v & maskOfAscii) != 0 {
			return false
		}
	}
	ptr = unsafe.Add(ptr, align8)
	//s = unsafe.String((*byte)(ptr), l&7)
	for i := 0; i < l&7; i++ {
		var c byte = *((*byte)(unsafe.Add(ptr, i)))
		if c >= utf8.RuneSelf {
			return false
		}
	}
	return true
}

type For3 struct {
	a uint16
	b uint8
}

type For5 struct {
	a uint32
	b uint8
}

type For6 struct {
	a uint32
	b uint16
}

type For7 struct {
	a uint32
	b uint16
	c uint8
}

func isAsciiForLenLess8(s string) uint64 {
	// if len(s) > 7 {
	// 	panic("len must less 8")
	// }
	ptr := unsafe.Pointer(unsafe.StringData(s))
	l := len(s)
	switch l {
	// case 0:
	// 	return 0
	case 1:
		v := *(*uint8)(ptr)
		return uint64(v)
	case 2:
		var v uint16 = *(*uint16)(ptr)
		return uint64(v)
	case 3:
		values := (*For3)(ptr)
		return uint64(values.a | uint16(values.b))
	case 4:
		v := *(*uint32)(ptr)
		return uint64(v)
	case 5:
		values := (*For5)(ptr)
		return uint64(values.a | uint32(values.b))
	case 6:
		values := (*For6)(ptr)
		return uint64(values.a | uint32(values.b))
	case 7:
		values := (*For7)(ptr)
		return uint64(values.a | uint32(values.b) | uint32(values.c))
	default:
		return 0
	}
}

func isAsciiForLenLess8_v2(s string) uint64 {
	// if len(s) > 7 {
	// 	panic("len must less 8")
	// }
	ptr := unsafe.Pointer(unsafe.StringData(s))
	l := len(s)
	switch l {
	// case 0:
	// 	return 0
	case 1:
		v := *(*uint8)(ptr)
		return uint64(v)
	case 2:
		var v uint16 = *(*uint16)(ptr)
		return uint64(v)
	case 3:
		v1 := *(*uint16)(ptr)
		v2 := *(*uint8)(unsafe.Add(ptr, 2))
		return uint64(v1 | uint16(v2))
	case 4:
		v := *(*uint32)(ptr)
		return uint64(v)
	case 5:
		v1 := *(*uint32)(ptr)
		v2 := *(*uint8)(unsafe.Add(ptr, 4))
		return uint64(v1 | uint32(v2))
	case 6:
		v1 := *(*uint32)(ptr)
		v2 := *(*uint16)(unsafe.Add(ptr, 4))
		return uint64(v1 | uint32(v2))
	case 7:
		v1 := *(*uint32)(ptr)
		v2 := *(*uint16)(unsafe.Add(ptr, 4))
		v3 := *(*uint8)(unsafe.Add(ptr, 6))
		return uint64(v1 | uint32(v2) | uint32(v3))
	default:
		return 0
	}
}

func isAsciiForLenLess8_v3(s string) uint64 {
	// if len(s) > 7 {
	// 	panic("len must less 8")
	// }
	ptr := unsafe.Pointer(unsafe.StringData(s))
	l := len(s)
	var ret uint64
	switch l {
	// case 0:
	// 	return 0
	case 1:
		v := *(*uint8)(ptr)
		ret = uint64(v)
	case 2:
		var v uint16 = *(*uint16)(ptr)
		ret = uint64(v)
	case 3:
		v1 := *(*uint16)(ptr)
		v2 := *(*uint8)(unsafe.Add(ptr, 2))
		ret = uint64(v1 | uint16(v2))
	case 4:
		v := *(*uint32)(ptr)
		ret = uint64(v)
	case 5:
		v1 := *(*uint32)(ptr)
		v2 := *(*uint8)(unsafe.Add(ptr, 4))
		ret = uint64(v1 | uint32(v2))
	case 6:
		v1 := *(*uint32)(ptr)
		v2 := *(*uint16)(unsafe.Add(ptr, 4))
		ret = uint64(v1 | uint32(v2))
	case 7:
		v1 := *(*uint32)(ptr)
		v2 := *(*uint16)(unsafe.Add(ptr, 4))
		v3 := *(*uint8)(unsafe.Add(ptr, 6))
		ret = uint64(v1 | uint32(v2) | uint32(v3))
	case 8:
		ret = *(*uint64)(ptr)
	default:
		ret = 0
	}
	return ret
}

func isAsciiForLenLess8_v4(ptr unsafe.Pointer, l int) uint64 {
	// if len(s) > 7 {
	// 	panic("len must less 8")
	// }
	//ptr := unsafe.Pointer(unsafe.StringData(s))
	//l := len(s)
	switch l {
	// case 0:
	// 	return 0
	case 1:
		v := *(*uint8)(ptr)
		return uint64(v)
	case 2:
		v := *(*uint16)(ptr)
		return uint64(v)
	case 3:
		v1 := *(*uint16)(ptr)
		v2 := *(*uint8)(unsafe.Add(ptr, 2))
		return uint64(v1 | uint16(v2))
	case 4:
		v := *(*uint32)(ptr)
		return uint64(v)
	case 5:
		v1 := *(*uint32)(ptr)
		v2 := *(*uint8)(unsafe.Add(ptr, 4))
		return uint64(v1 | uint32(v2))
	case 6:
		v1 := *(*uint32)(ptr)
		v2 := *(*uint16)(unsafe.Add(ptr, 4))
		return uint64(v1 | uint32(v2))
	case 7:
		v1 := *(*uint32)(ptr)
		v2 := *(*uint16)(unsafe.Add(ptr, 4))
		v3 := *(*uint8)(unsafe.Add(ptr, 6))
		return uint64(v1 | uint32(v2) | uint32(v3))
	case 8:
		return *(*uint64)(ptr)
	default:
		return 0
	}
}

func is_ascii_for_align8(ptr unsafe.Pointer, l int) uint64 { // bug: 这里最多有 7 个
	// if len(s)&7 != 0 {
	// 	panic("must align 8")
	// }
	//ptr := unsafe.Pointer(unsafe.StringData(s))
	cnt := l >> 3 // l / 8
	switch cnt {
	case 1:
		var v uint64 = *((*uint64)(ptr))
		return v
	case 2:
		values := ((*[2]uint64)(ptr))
		// v1 := values[0]
		// v2 := values[1]
		//var v2 uint64 = *((*uint64)(unsafe.Add(ptr, 8)))
		//return (v1 | v2)
		return values[0] | values[1]
	case 3:
		values := ((*[3]uint64)(ptr))
		return values[0] | values[1] | values[2]
		// v1 := values[0]
		// v2 := values[1]
		// v3 := values[2]
		// return (v1 | v2 | v3)
		// var v1 uint64 = *((*uint64)(ptr))
		// var v2 uint64 = *((*uint64)(unsafe.Add(ptr, 8)))
		// var v3 uint64 = *((*uint64)(unsafe.Add(ptr, 16)))
		// return (v1 | v2 | v3)
	default:
		return 0
	}
}

func isAsciiForLenLess64(ptr unsafe.Pointer, l int) uint64 {
	loc := l & (-8)
	v1 := is_ascii_for_align8(ptr, loc)
	v2 := isAsciiForLenLess8_v4(unsafe.Add(ptr, loc), l-loc)
	return v1 | v2
}

func IsASCII_v9(s string) bool {
	addr := uint64(uintptr(unsafe.Pointer(unsafe.StringData(s))))
	alignAddr := (addr + uint64(63)) & (^uint64(63))
	headLen := alignAddr - addr
	ptr := unsafe.Pointer(unsafe.StringData(s))
	//
	v := isAsciiForLenLess64(ptr, int(headLen))
	if (v & maskOfAscii) != 0 {
		return false
	}
	//
	l := len(s) - int(headLen)
	align64 := l & (-64)
	ptr = unsafe.Add(ptr, headLen)
	//buf := unsafe.Slice(unsafe.StringData(s), align8)
	for i := 0; i < align64; i += 64 {
		values := ((*[8]uint64)(unsafe.Add(ptr, i)))
		a := values[0]
		b := values[1]
		c := values[2]
		d := values[3]
		e := values[4]
		f := values[5]
		g := values[6]
		h := values[7]
		// bits := ((a & maskOfAscii) |
		// 	(b & maskOfAscii) |
		// 	(c & maskOfAscii) |
		// 	(d & maskOfAscii) |
		// 	(e & maskOfAscii) |
		// 	(f & maskOfAscii) |
		// 	(g & maskOfAscii) |
		// 	(h & maskOfAscii))
		bits := (a | b | c | d | e | f | g | h) & maskOfAscii
		if bits != 0 { // 一定要加括号，否则优先级有问题
			return false
		}
	}
	//
	v1 := isAsciiForLenLess64(unsafe.Add(ptr, align64), l&63)
	return (v1 & maskOfAscii) == 0
}

func IsASCII_v10(s string) bool {
	ptr := unsafe.Pointer(unsafe.StringData(s))
	addr := uint64(uintptr(ptr))
	alignAddr := (addr + uint64(63)) & (^uint64(63))
	headLen := alignAddr - addr
	//
	isEnd := false
	leftLen := len(s) - int(headLen)
	align8Len := int(headLen) & (-8)
	less8Len := len(s) - align8Len
	align64Len := leftLen & (-64)
	if len(s) < 64 {
		isEnd = true
		align8Len = len(s) & (-8)
		less8Len = len(s) & 7
		goto len_less_64
	}
	if headLen == 0 {
		goto align64
	}
len_less_64:
	if ((is_ascii_for_align8(ptr, align8Len) |
		isAsciiForLenLess8_v4(unsafe.Add(ptr, align8Len), less8Len)) & maskOfAscii) != 0 {
		return false
	}
	if isEnd {
		return true
	}
align64:
	//
	// l := len(s) - int(headLen)
	// align64 := l & (-64)
	ptr = unsafe.Add(ptr, headLen)
	//buf := unsafe.Slice(unsafe.StringData(s), align8)
	for i := 0; i < align64Len; i += 64 {
		values := ((*[8]uint64)(unsafe.Add(ptr, i)))
		a := values[0]
		b := values[1]
		c := values[2]
		d := values[3]
		e := values[4]
		f := values[5]
		g := values[6]
		h := values[7]
		// bits := ((a & maskOfAscii) |
		// 	(b & maskOfAscii) |
		// 	(c & maskOfAscii) |
		// 	(d & maskOfAscii) |
		// 	(e & maskOfAscii) |
		// 	(f & maskOfAscii) |
		// 	(g & maskOfAscii) |
		// 	(h & maskOfAscii))
		bits := (a | b | c | d | e | f | g | h) & maskOfAscii
		if bits != 0 { // 一定要加括号，否则优先级有问题
			return false
		}
	}
	isEnd = true
	ptr = unsafe.Add(ptr, align64Len)
	leftLen -= align64Len
	align8Len = leftLen & (-8)
	less8Len = leftLen - align8Len
	goto len_less_64
}

func IsASCII_v11(s string) bool {
	ptr := unsafe.Pointer(unsafe.StringData(s))
	addr := uint64(uintptr(ptr))
	alignAddr := (addr + uint64(63)) & (^uint64(63))
	headLen := alignAddr - addr
	//
	isEnd := false
	// leftLen := len(s) - int(headLen)
	// align8Len := int(headLen) & (-8)
	// less8Len := len(s) - align8Len
	// align64Len := leftLen & (-64)
	//processLen := headLen
	var processLen int
	var tempLen int
	var result uint64
	var result2 uint64
	var align64Len int
	var leftLen int

	//

	if len(s) < 64 {
		isEnd = true
		// align8Len = len(s) & (-8)
		// less8Len = len(s) & 7
		processLen = len(s)
		goto len_less_64
	}
	align64Len = (len(s) - int(headLen)) & (-64)
	leftLen = (len(s) - int(headLen)) & 63
	if headLen == 0 {
		goto align64
	}
	processLen = int(headLen)
len_less_64:
	result2 = 0
	for processLen > 0 {
		if processLen >= 8 {
			tempLen = 8
		} else {
			tempLen = processLen
		}
		processLen -= tempLen
		// 处理 l 长度的内容
		switch tempLen {
		case 1:
			v := *(*uint8)(ptr)
			result = uint64(v)
		case 2:
			v := *(*uint16)(ptr)
			result = uint64(v)
		case 3:
			v1 := *(*uint16)(ptr)
			v2 := *(*uint8)(unsafe.Add(ptr, 2))
			result = uint64(v1 | uint16(v2))
		case 4:
			v := *(*uint32)(ptr)
			result = uint64(v)
		case 5:
			v1 := *(*uint32)(ptr)
			v2 := *(*uint8)(unsafe.Add(ptr, 4))
			result = uint64(v1 | uint32(v2))
		case 6:
			v1 := *(*uint32)(ptr)
			v2 := *(*uint16)(unsafe.Add(ptr, 4))
			result = uint64(v1 | uint32(v2))
		case 7:
			v1 := *(*uint32)(ptr)
			v2 := *(*uint16)(unsafe.Add(ptr, 4))
			v3 := *(*uint8)(unsafe.Add(ptr, 6))
			result = uint64(v1 | uint32(v2) | uint32(v3))
		case 8:
			result = *(*uint64)(ptr)
		default:
			result = 0
		}
		ptr = unsafe.Add(ptr, tempLen)
		result2 |= result
	}
	if (result2 & maskOfAscii) != 0 {
		return false
	}
	if isEnd {
		return true
	}
align64:
	//
	// l := len(s) - int(headLen)
	// align64 := l & (-64)
	//ptr = unsafe.Add(ptr, headLen)
	//buf := unsafe.Slice(unsafe.StringData(s), align8)
	for i := 0; i < align64Len; i += 64 {
		values := ((*[8]uint64)(unsafe.Add(ptr, i)))
		a := values[0]
		b := values[1]
		c := values[2]
		d := values[3]
		e := values[4]
		f := values[5]
		g := values[6]
		h := values[7]
		// bits := ((a & maskOfAscii) |
		// 	(b & maskOfAscii) |
		// 	(c & maskOfAscii) |
		// 	(d & maskOfAscii) |
		// 	(e & maskOfAscii) |
		// 	(f & maskOfAscii) |
		// 	(g & maskOfAscii) |
		// 	(h & maskOfAscii))
		bits := (a | b | c | d | e | f | g | h) & maskOfAscii
		if bits != 0 { // 一定要加括号，否则优先级有问题
			return false
		}
	}
	isEnd = true
	ptr = unsafe.Add(ptr, align64Len)
	// leftLen -= align64Len
	// align8Len = leftLen & (-8)
	// less8Len = leftLen - align8Len
	processLen = leftLen
	goto len_less_64
}

func IsASCII_v12(s string) bool {
	if len(s) == 0 {
		return true
	}
	ptr := unsafe.Pointer(unsafe.StringData(s))
	addr := uint64(uintptr(ptr))
	alignAddr := (addr + uint64(63)) & (^uint64(63))
	headLen := alignAddr - addr
	isEnd := false
	var processLen int
	var tempLen int
	var result uint64
	var align64Len int
	var leftLen int
	var uint64Cnt int
	var values *[8]uint64
	//
	if len(s) < 64 {
		isEnd = true
		processLen = len(s)
		goto len_less_64
	}
	tempLen = (len(s) - int(headLen))
	align64Len = tempLen & (-64)
	leftLen = tempLen & 63
	if headLen == 0 {
		goto align64
	}
	processLen = int(headLen)
len_less_64:
	result = 0
	uint64Cnt = processLen >> 3 // processLen / 8
	tempLen = processLen & 7
	switch uint64Cnt {
	case 1:
		result |= *(*uint64)(ptr)
	case 2:
		values = (*[8]uint64)(ptr)
		result |= (values[0] | values[1])
	case 3:
		values = (*[8]uint64)(ptr)
		result |= (values[0] | values[1] | values[2])
	case 4:
		values = (*[8]uint64)(ptr)
		result |= (values[0] | values[1] | values[2] | values[3])
	case 5:
		values = (*[8]uint64)(ptr)
		result |= (values[0] | values[1] | values[2] | values[3] | values[4])
	case 6:
		values = (*[8]uint64)(ptr)
		result |= (values[0] | values[1] | values[2] | values[3] | values[4] | values[5])
	case 7:
		values = (*[8]uint64)(ptr)
		result |= (values[0] | values[1] | values[2] | values[3] | values[4] | values[5] | values[6])
	case 8:
		values = (*[8]uint64)(ptr)
		result |= (values[0] | values[1] | values[2] | values[3] | values[4] | values[5] | values[6] | values[7])
	}
	ptr = unsafe.Add(ptr, processLen&(-8))
	switch tempLen {
	case 1:
		v := *(*uint8)(ptr)
		result |= uint64(v)
	case 2:
		v := *(*uint16)(ptr)
		result |= uint64(v)
	case 3:
		v1 := *(*uint16)(ptr)
		v2 := *(*uint8)(unsafe.Add(ptr, 2))
		result |= uint64(v1 | uint16(v2))
	case 4:
		v := *(*uint32)(ptr)
		result |= uint64(v)
	case 5:
		v1 := *(*uint32)(ptr)
		v2 := *(*uint8)(unsafe.Add(ptr, 4))
		result |= uint64(v1 | uint32(v2))
	case 6:
		v1 := *(*uint32)(ptr)
		v2 := *(*uint16)(unsafe.Add(ptr, 4))
		result |= uint64(v1 | uint32(v2))
	case 7:
		v1 := *(*uint32)(ptr)
		v2 := *(*uint16)(unsafe.Add(ptr, 4))
		v3 := *(*uint8)(unsafe.Add(ptr, 6))
		result |= uint64(v1 | uint32(v2) | uint32(v3))
	case 8:
		result |= *(*uint64)(ptr)
	}
	ptr = unsafe.Add(ptr, tempLen)
	if (result & maskOfAscii) != 0 {
		return false
	}
	if isEnd {
		return true
	}
align64:
	for i := 0; i < align64Len; i += 64 {
		values := ((*[8]uint64)(unsafe.Add(ptr, i)))
		a := values[0]
		b := values[1]
		c := values[2]
		d := values[3]
		e := values[4]
		f := values[5]
		g := values[6]
		h := values[7]
		bits := (a | b | c | d | e | f | g | h) & maskOfAscii
		if bits != 0 { // 一定要加括号，否则优先级有问题
			return false
		}
	}
	isEnd = true
	ptr = unsafe.Add(ptr, align64Len)
	processLen = leftLen
	goto len_less_64
}
