package main

import (
	"fmt"
	"log"
	"net"
	"net/rpc"
	"net/rpc/jsonrpc"
)

type HelloService struct {}

func (w *HelloService) Hello(request string, reply *string) error {
	*reply = "Hello, " + request
	return nil
}

func main() {
	err := rpc.RegisterName("HelloService", new(HelloService))
	if err != nil {
		log.Fatal(err)
	}

	listener, err := net.Listen("tcp", ":3333")
	if err != nil {
		log.Fatal(err)
	}

	for {
		conn, err := listener.Accept()
		if err != nil {
			fmt.Print("listener.Accept()")
		}
		go rpc.ServeCodec(jsonrpc.NewServerCodec(conn))
	}
}
