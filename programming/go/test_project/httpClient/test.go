package main

import (
	"fmt"
	"net"
	"os"
	"time"
)

type Person struct {
	name string
	age int
	id int
}

func (personInfoPtr Person) getPersonInfo() int {
	fmt.Printf("Name:%s", personInfoPtr.name)
	return 1
}

func testFunc(c chan int) {
	j := 0

	for i := 0; i < 100; i++ {
		for i :=0; i < 100; i++ {
			j += i
		}
	}

	time.Sleep(3 * time.Second)
	c <- j
}

func main() {
	con, err := net.Dial("tcp", "127.0.0.1:3333")
	if err != nil {
		fmt.Printf("%s", "Connection failed")
		os.Exit(-1)
	} else {
		helloStr := "Hello from go"
		con.Write([]byte(helloStr))
		con.Close()
	}
}
