package main

import (
	"fmt"
	"sync"
)

func workerMutex(wg *sync.WaitGroup) {
	defer wg.Done()
	for k := 0; k < 100; k++ {
		dataStruct.Lock()
		dataStruct.value++
		dataStruct.Unlock()
	}
}

func wokerChannel(done chan bool) {
	for k := 0; k < 100; k++ {
		dataStruct.Lock()
		dataStruct.value++
		dataStruct.Unlock()
	}
	done <- true
}

var dataStruct struct {
	sync.Mutex
	value int
}

func main() {
	done := make(chan bool, 10)
	for j := 0; j < 100; j++ {
		go wokerChannel(done)
	}
	for j := 0; j < 100; j++ {
		<- done
	}

	fmt.Print(dataStruct.value)
}
