package main

import (
	"bytes"
	"caesar_crypt/caesar/fastcgo"
	"caesar_crypt/caesar/golang"
	"caesar_crypt/caesar/plan9asm"
	"fmt"
	"os"
	"runtime"
	"time"
)

const (
	inStr = "abcdefghijklmnopqrstuvwxyz.ABCDEFGHIJKLMNOPQRSTUVWXYZ123456789..."
)

type CaesarCryptFunc func(out []byte, in []byte, rotate int)

var funcs = map[string]CaesarCryptFunc{
	"golang.CaesarCrypt":               golang.CaesarCrypt,
	"golang.CaesarCryptBySearchTable":  golang.CaesarCryptBySearchTable,
	"fastcgo.CaesarCryptByFastCgo":     fastcgo.CaesarCryptByFastCgo,
	"fastcgo.CaesarCryptByFastCgoAvx2": fastcgo.CaesarCryptByFastCgoAvx2,
	"fastcgo.CaesarCryptByFastCgoAvx512": fastcgo.CaesarCryptByFastCgoAvx512,
	"plan9asm.CaesarCryptAsm":     plan9asm.CaesarCryptAsm,
	"plan9asm.CaesarCryptAsmAvx2": plan9asm.CaesarCryptAsmAvx2,
}

func runAvx2() {
	in := []byte(inStr)
	rotate := 0
	fmt.Printf("in :%s\n", inStr)
	out := make([]byte, len(in))
	funcs["plan9asm.CaesarCryptAsmAvx2"](out, in, rotate)
	fmt.Printf("out:%s | \n", string(out))
}

func run() {
	in := []byte(inStr)
	rotate := 0
	fmt.Printf("in :%s\n", inStr)
	for name, f := range funcs {
		out := make([]byte, len(in))
		f(out, in, rotate)
		fmt.Printf("out:%s | %s\n", string(out), name)
	}
}

func check() bool {
	raw := []byte(inStr)
	for j := 0; j < 16; j++ {
		in := raw[j:]
		fmt.Printf("in:  %s\n", string(in))
		for i := 0; i < 26; i++ {
			std := make([]byte, len(in))
			funcs["golang.CaesarCrypt"](std, in, i)
			for name, f := range funcs {
				out := make([]byte, len(in))
				f(out, in, i)
				if !bytes.Equal(std, out) {
					fmt.Printf("\nout :%s | %s\n", string(out), name)
					fmt.Printf("need:%s | rot=%d\n", string(std), i)
					return false
				}
			}
		}
	}
	return true
}

func makeData() []byte {
	content, _ := os.ReadFile("/proc/self/status")
	const size = 1024 * 1024 * 64
	buf := make([]byte, 0, size)
	for len(buf)-len(content) < size {
		buf = append(buf, content...)
	}
	return buf
}

func benchmark() {
	buf := makeData()
	fmt.Printf("test data len:%d\n", len(buf))
	out := make([]byte, len(buf))
	rotate := 5
	for name, f := range funcs {
		start := time.Now()
		f(out, buf, rotate)
		us := time.Since(start).Microseconds()
		perf := float64(len(buf)) / (float64(us) / 1000000.0) / 1024.0 / 1024.0 // 每秒处理多少 kb
		fmt.Printf("%-40s %10.4f\n", name, perf)
	}
}

func main() {
	runtime.GOMAXPROCS(1)
	//runAvx2()
	run()
	if !check() {
		return
	}
	benchmark()
}
