package main

import (
	"fmt"
	"os"
	"sort"
	"strconv"
	"sync"
	"time"
)

func main() {
	var portArray []string
	var startPort, stopPort int
	var wg  sync.WaitGroup

	// handle single port (-p 80)
	// _, err0 := fmt.Sscanf(portRange, "%d", &startPort)
	// if err0 == nil {
	// 	stopPort = startPort
	// }

	// handle multiple port (-p 100-200)
	_, err := fmt.Sscanf(portRange, "%d-%d", &startPort, &stopPort)

	if err != nil {
		_, _ = fmt.Fprint(os.Stderr, "port format error")
		os.Exit(-1)
	}

	// Generate port array, we need convert integer into ascii, because DataAverage needs asscii
	for i := startPort; i < stopPort; i++ {
		portArray = append(portArray, strconv.Itoa(i))
	}

	// Average data, so that every worker does its own job
	portAverage := AverageData(nThread, portArray)

	timeNow := time.Now()
	for i := 0; i < nThread; i++ {
		wg.Add(1)
		go portScanWorker(host, portAverage[i], &wg)
	}
	wg.Wait()
	timeEscape := time.Since(timeNow)

	sort.Strings(openPortArray)
	fmt.Println("Open ports:")
	fmt.Println(openPortArray)
	fmt.Printf("Time:%v\n", timeEscape)
}
