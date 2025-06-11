package is_sorted

import (
	"unsafe"
)

func IsSorted2(a []int64) bool {
	if len(a) >= 9 {
		alignLen := (len(a) - 1) & (-8)
		ptr := unsafe.Pointer(&a[0])
		for i := 0; i < alignLen; i += 8 {
			arr1 := (*[8]int64)(unsafe.Add(ptr, i*8))
			arr2 := (*[8]int64)(unsafe.Add(ptr, i*8+8))
			result := ((*arr1)[0] > (*arr2)[0]) ||
				((*arr1)[1] > (*arr2)[1]) ||
				((*arr1)[2] > (*arr2)[2]) ||
				((*arr1)[3] > (*arr2)[3]) ||
				((*arr1)[4] > (*arr2)[4]) ||
				((*arr1)[5] > (*arr2)[5]) ||
				((*arr1)[6] > (*arr2)[6]) ||
				((*arr1)[7] > (*arr2)[7])
			if result {
				return false
			}
		}
		a = a[alignLen:]
	}
	for i := range a {
		if i > 0 && a[i] < a[i-1] {
			return false
		}
	}
	return true
}

// a<=b
func isLessEqual0(a, b int64) int64 {
	// 这里不能处理 int64 max 和 int64 min
	diff := a - b
	sign := diff >> 63
	isZero := (^(diff | (-diff))) >> 63
	return (sign | isZero)
}

// a<=b, 需要 14 条指令
func isLessEqual(a, b int64) int64 {
	signA := a >> 63
	signB := b >> 63
	signDiff := signA ^ signB
	aNegativeAndDiffSign := signDiff & signA // case 1: a 负 b 正
	//
	diff := a - b
	diffSign := diff >> 63
	diffNonzero := (diff | (-diff)) >> 63
	diffZero := ^diffNonzero
	case2 := (^signDiff) & (diffSign | diffZero)
	return (aNegativeAndDiffSign | case2)
}

func isLessEqualUint64(a, b uint64) uint64 {
	diff := a - b
	sign := diff >> 63
	xor := a ^ b
	isEqual := (^(((xor) | (-(xor))) >> 63)) & 1
	return sign | isEqual
}

func isGreaterForTimestamp(a, b int64) int64 {
	// 当 a , b 都是非负整数的时候，用这个方法来比较
	return (b - a) >> 63
}

func IsSorted3(a []int64) bool {
	if len(a) >= 9 {
		alignLen := (len(a) - 1) & (-8)
		ptr := unsafe.Pointer(&a[0])
		for i := 0; i < alignLen; i += 8 {
			arr1 := (*[8]int64)(unsafe.Add(ptr, i*8))
			arr2 := (*[8]int64)(unsafe.Add(ptr, i*8+8))
			result := isLessEqual((*arr1)[0], (*arr2)[0]) |
				isLessEqual((*arr1)[1], (*arr2)[1]) |
				isLessEqual((*arr1)[2], (*arr2)[2]) |
				isLessEqual((*arr1)[3], (*arr2)[3]) |
				isLessEqual((*arr1)[4], (*arr2)[4]) |
				isLessEqual((*arr1)[5], (*arr2)[5]) |
				isLessEqual((*arr1)[6], (*arr2)[6]) |
				isLessEqual((*arr1)[7], (*arr2)[7])
			if result == 0 {
				return false
			}
		}
		a = a[alignLen:]
	}
	for i := range a {
		if i > 0 && a[i] < a[i-1] {
			return false
		}
	}
	return true
}

func switchTest(a int) int {
	switch a {
	case 1:
		return 100
	case 2:
		return 103
	case 3:
		return 205
	case 4:
		return 309
	case 5:
		return 413
	case 6:
		return 517
	case 7:
		return 621
	case 8:
		return 725
	case 9:
		return 829
	default:
		return 933
	}
}

func IsSorted4(a []int64) bool {
	if len(a) >= 9 {
		alignLen := (len(a) - 1) & (-8)
		ptr := unsafe.Pointer(&a[0])
		for i := 0; i < alignLen; i += 8 {
			arr1 := (*[8]int64)(unsafe.Add(ptr, i*8))
			arr2 := (*[8]int64)(unsafe.Add(ptr, i*8+8))
			result := isGreaterForTimestamp((*arr1)[0], (*arr2)[0]) |
				isGreaterForTimestamp((*arr1)[1], (*arr2)[1]) |
				isGreaterForTimestamp((*arr1)[2], (*arr2)[2]) |
				isGreaterForTimestamp((*arr1)[3], (*arr2)[3]) |
				isGreaterForTimestamp((*arr1)[4], (*arr2)[4]) |
				isGreaterForTimestamp((*arr1)[5], (*arr2)[5]) |
				isGreaterForTimestamp((*arr1)[6], (*arr2)[6]) |
				isGreaterForTimestamp((*arr1)[7], (*arr2)[7])
			if result != 0 {
				return false
			}
		}
		a = a[alignLen:]
	}
	for i := range a {
		if i > 0 && a[i] < a[i-1] {
			return false
		}
	}
	return true
}
