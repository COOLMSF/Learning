package main

import (
	"fmt"
	"log"
	"net"
)

func main() {
	mx, err := net.LookupMX("8.8.8.8")
	if err != nil {
		log.Fatal(err)
	}

	for i := range mx {
		fmt.Println(i)
	}
}
