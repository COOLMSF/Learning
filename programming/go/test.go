package main

import (
	"fmt"
	"sync"
)

func worker(data []string, wg *sync.WaitGroup) {
	defer wg.Done()
	fmt.Print(data)
}

func dataAverage(nThread int, dataArray []string) [][]string {
	resultArray := make([][]string, nThread)
	for i := 0; i < nThread; i++ {
		resultArray[i] = dataArray[(len(dataArray) / nThread) * i: (len(dataArray) / nThread) * (i + 1)]
		// Assign the left data to the last thread
		if i == nThread - 1 {
			resultArray[i] = dataArray[(len(dataArray) / nThread) * i:]
		}
	}
	return resultArray
}


func main() {
	wg := sync.WaitGroup{}
	nThread := 8
	var w = []string { "Hello", "world", "this", "is", "a", "test", "I hope", "This will", " works",
		"but", " it", "might", "not", "worK", "I", "don't", "know" }
	k := dataAverage(8, w)

	for i := 0; i < nThread; i++ {
		wg.Add(1)
		go worker(k[i], &wg)
	}
	wg.Wait()
}
