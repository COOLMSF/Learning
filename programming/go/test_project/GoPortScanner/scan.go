package main

import (
	"net"
	"strconv"
	"time"
)

func scanAPort(port int, host string, c chan int) {
	timeout := time.Second * 1
	_, err := net.DialTimeout("tcp", host + ":" + strconv.Itoa(port), timeout)
	if err == nil {
		c <- port
	}
}

func scanPortConcurrency(portStart, portStop int, host string, c chan int) {
	timeout := time.Second * 3
	for port := portStart; port <= portStop; port++ {
		_, err := net.DialTimeout("tcp", host + ":" + strconv.Itoa(port), timeout)
		if err != nil {
			continue
		}
		c <- port
	}
	done <- true
}

func scanPort(portStart , portStop int, host string, c chan int) {
	timeout := time.Second
	for port := portStart; port <= portStop; port++ {
		_, err := net.DialTimeout("tcp", host + ":" + strconv.Itoa(port), timeout)
		if err != nil {
			continue
		}
		// fmt.Printf("%s:%d\n", host, port)
		c <- port
	}
	done <- true
}

func fetchOpenPort(portList []int, c chan int) {
	for {
		i := <-c
		openPortList = append(openPortList, i)
	}
}
