package golang

// CaesarCrypt 最常规的方式来实现
func CaesarCrypt(out []byte, in []byte, rotate int) {
	rotate %= 26
	for i, c := range in {
		if c >= 'a' && c <= 'z' {
			out[i] = ((c-'a')+byte(rotate))%26 + 'a'
		} else if c >= 'A' && c <= 'Z' {
			out[i] = ((c-'A')+byte(rotate))%26 + 'A'
		} else {
			out[i] = c
		}
	}
}
