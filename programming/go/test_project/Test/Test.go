package main

import (
	"bytes"
	"fmt"
	"io"
)

type UpperWriter struct {
	io.Writer
}

func (p *UpperWriter)Write(data []byte) (n int, err error) {
	return p.Writer.Write(bytes.ToUpper(data))
}

func test(args ...interface{}) {
	for _, i := range args{
		fmt.Print(i)
	}
}

func main() {
	test(1, 2, 3, "Hello")
}
