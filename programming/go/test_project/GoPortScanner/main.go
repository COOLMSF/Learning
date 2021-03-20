package main

import (
	"flag"
	"fmt"
	"time"
)

var done = make(chan bool)
var openPortList = make([]int, 0)

func main() {
	var startPort, stopPort int
	channel := make(chan int)

	hostPtr := flag.String("host", "localhost", "host name")
	portPtr := flag.String("port", "1-65535", "port range")
	flag.Parse()

	host := *hostPtr
	port := *portPtr
	_, _ = fmt.Sscanf(port, "%d-%d", &startPort, &stopPort)

	var newStartPort, newStopPort int
	nThreads := 10
	newStartPort = startPort

	// Make N threads, every thread do its own job
	for i := 0; i < nThreads + 1; i++ {
		newStopPort = startPort + (stopPort - startPort) / nThreads * i
		go scanPortConcurrency(newStartPort, newStopPort, host, channel)
		// fmt.Printf("start port:%d stop port %d\n", newStartPort, newStopPort)
		newStartPort = newStopPort
	}

	go fetchOpenPort(openPortList, channel)

	// Wait for all threads
	for i:=0; i < nThreads; i++ {
		<- done
		p := float32(i) / float32(nThreads)
		fmt.Printf("Done %f%%\n", p * 100)
	}

	// Give time to fetchOpenPort, this might not work
	time.Sleep(time.Second * 3)
	fmt.Print(openPortList)
}
