package main

import (
	"flag"
	"log"
	"os"
	"runtime"
	"strings"
	"sync"
)

var nThread int
var zipFile, dictFile string

func init() {
	flag.IntVar(&nThread, "n", runtime.NumCPU(), "N threads")
	flag.StringVar(&zipFile, "f", "", "zip file name")
	flag.StringVar(&dictFile, "d", "", "dictionary file")
	flag.Parse()

	if zipFile == "" || dictFile == "" {
		flag.Usage()
		os.Exit(-1)
	}
}

func main() {
	dictFile, err := os.Open(dictFile)
	if err != nil {
		log.Fatal(err)
	}

	dictFileInfo, err := dictFile.Stat()
	if err != nil {
		log.Fatal(err)
	}
	size := dictFileInfo.Size()

	// Create the buffer that hold dict data
	dictBuffer := make([]byte, size)

	_, err = dictFile.Read(dictBuffer)
	if err != nil {
		log.Fatal()
	}

	// Handle data
	dictArray := strings.Split(string(dictBuffer), "\n")
	dictArrayAverage := DataAverage(nThread, dictArray)

	wg := sync.WaitGroup{}
	for i := 0; i < nThread; i++ {
		wg.Add(1)
		dictArray = dictArrayAverage[i]
		go zipCrackerWorker(zipFile, dictArray, &wg)
	}
	wg.Wait()
}
