package main

import (
	"fmt"
	"io"
	"net"
	"os"
)

func main() {
	// Build socket
	listener, err := net.Listen("tcp", "127.0.0.1:3333")
	if err != nil {
		fmt.Print("net.Listen error")
		os.Exit(-1)
	}

	// Wait for client
	conn, err := listener.Accept()
	if err != nil {
		fmt.Print("listener.Accept error")
		os.Exit(-1)
	}

	// Produce received data
	buffer := make([]byte, 512)
	for {
		_, err := conn.Read(buffer)
		if err == io.EOF {
			_, _ = fmt.Fprintf(os.Stderr, "%s", "Disconnected from client")
			break
		}
		if err != nil {
			_, _ = fmt.Fprintf(os.Stderr, "%s", "Unexpected error")
			break
		}

		// Ok, print data
		fmt.Print(string(buffer))
	}
}
