package main

import (
	"fmt"
	"strconv"
)

func main() {
	s := strconv.FormatFloat(123.123, 'g', 12, 64)
	f, _ := strconv.ParseFloat("123.123", 64)
	fmt.Printf("%f", f)
	fmt.Printf("%s", s)
}
