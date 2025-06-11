package main

import (
	"fmt"
	"static_data/pkg"
)

func main() {
	fmt.Println("hello")
	fmt.Printf("Get:%08x\n", pkg.Get())
	fmt.Printf("GetVar1:%08x\n", pkg.GetVar1())
	pkg.SetVar1(0xfedcba98)
	fmt.Printf("GetVar1:%08x\n", pkg.GetVar1())
	//
	fmt.Printf("GetFilePrivateData:%08x\n", pkg.GetFilePrivateData())
	pkg.SetFilePrivateData(0xfedcba98)
	fmt.Printf("GetFilePrivateData:%08x\n", pkg.GetFilePrivateData())
	//
	fmt.Printf("GetAvx2DataAddress:%08x\n", pkg.GetAvx2DataAddress())
}
