package main

import (
	"fmt"
	"github.com/alexmullins/zip"
	"log"
	"os"
	"sync"
)

func DataAverage(nThread int, dataArray []string) [][]string {
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

func zipCrackerWorker(zipFile string, dictData []string, wg *sync.WaitGroup) {
	zipFilePtr, err := zip.OpenReader(zipFile)
	if err != nil {
		log.Fatal(err)
	}
	defer wg.Done()
	defer zipFilePtr.Close()

	// Try every password
	for _, password := range dictData {
		for _, i := range zipFilePtr.File {
			i.SetPassword(password)

			_, err := i.Open()
			if err == nil {
				fmt.Println("[+] PASSWORD FOUND")
				fmt.Println(password)
				os.Exit(0)
			}
		}
	}
}