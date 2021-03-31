package main

import (
	"fmt"
	"log"
	"net/rpc"
	"net/rpc/jsonrpc"
)

func main() {
	var reply string
	rpc

	conn, err := rpc.Dial("tcp", ":3333")
	if err != nil {
		log.Fatal(err)
	}
	c := rpc.NewClientWithCodec(jsonrpc.NewClientCodec(conn))

	err = c.Call("HelloService.Hello", "coolder", &reply)
	if err != nil {
		log.Fatal(err)
	}

	fmt.Print(reply)

}
