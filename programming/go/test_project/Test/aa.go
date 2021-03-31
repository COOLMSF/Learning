package main

import (
	"fmt"
	"sync"
)

var (
	mutex sync.Mutex
	num int
)

func add(wg *sync.WaitGroup) {
	defer wg.Done()
	mutex.Lock()
	num++
	mutex.Unlock()
}

func main() {
	wg := sync.WaitGroup{}

	for i := 0; i < 1000; i++ {
		wg.Add(1)
		go add(&wg)
	}
	wg.Wait()
	fmt.Print(num)
}
