package pkg

var globalVariableExample int64

func Get() int64

func Set(v int64)

func GetAddress() uint64

/*
//汇编中无法引用 golang 中的常量

const valueOfXX = int64(0)

func GetConst() int64
*/
