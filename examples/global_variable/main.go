package main

import (
	"fmt"
	"global_variable/pkg"
)

func main() {
	fmt.Println("hello")
	fmt.Println("Get:", pkg.Get())
	pkg.Set(12345678)
	fmt.Println("Get:", pkg.Get())
	fmt.Printf("GetAddress:%08x\n", pkg.GetAddress())
}
