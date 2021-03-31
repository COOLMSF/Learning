package main

import (
	"fmt"
	"log"
	"net/rpc"
)

type RPCData struct {
	a, b int
}

func main() {
	client, err := rpc.Dial("tcp", ":3333")
	if err != nil {
		log.Fatal(err)
	}

	var reply string
	err = client.Call("AddService.Add",RPCData{100, 200}, &reply)
	if err != nil {
		log.Fatal(err)
	}

	fmt.Print(reply)
}
