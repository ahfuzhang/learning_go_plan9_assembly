//go:build !amd64
// +build !amd64

package is_ascii

import (
	"unicode/utf8"
)

func IsASCII(s string) bool {
	for i := range s {
		if s[i] >= utf8.RuneSelf {
			return false
		}
	}
	return true
}
