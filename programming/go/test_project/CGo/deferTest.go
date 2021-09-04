package main

import (
	"fmt"
	"io"
	"os"
)

func producer(c chan int) {
	for i := 0; ; i++ {
		c<-i
	}
}

func main() {
	var x interface {} = os.Stderr
	var a io.Writer = os.Stdout
	a.(*os.File)
	fmt.Printf("%T", x)
}
