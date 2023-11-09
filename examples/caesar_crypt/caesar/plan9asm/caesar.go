package plan9asm

import (
	"caesar_crypt/caesar/golang" // GetTable
)

// CaesarCryptAsm 汇编版本
func CaesarCryptAsm(out []byte, in []byte, rotate int)

// CaesarCryptAsmAvx2 汇编版本
func CaesarCryptAsmAvx2(out []byte, in []byte, rotate int)

var table = golang.GetTable()
