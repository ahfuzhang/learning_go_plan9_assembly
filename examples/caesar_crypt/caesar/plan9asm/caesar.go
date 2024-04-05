package plan9asm

import (
	"caesar_crypt/caesar/golang"
)

// CaesarCryptAsm 汇编版本
func CaesarCryptAsm(out []byte, in []byte, rotate int)

// CaesarCryptAsmAvx2 汇编版本，使用 avx2 指令集
func CaesarCryptAsmAvx2(out []byte, in []byte, rotate int)

var table = golang.GetTable() // todo: 汇编代码无法直接调用 golang.GetTable()
