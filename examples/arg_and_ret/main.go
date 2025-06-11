package main

import (
	"arg_and_ret/pkg"
	"fmt"
)

func main() {
	fmt.Println("hello")
	fmt.Println(pkg.Add(1, 2, 3, 4))
}
