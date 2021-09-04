package main

import (
	"fmt"
	"log"
	"os"
)

// We need to make the absolute path
func readFile(name string) {
	filePtr, err := os.Open(name); {
		if err != nil {
			log.Fatalf("os.Open:%v\n", err)
		}

		dirList, err := filePtr.ReadDir(0); {
			if err != nil {
				log.Fatalf("filePtr.ReadDir %v\n", err)
			}

			curPath := name

			for _, dir := range dirList {
				if dir.IsDir() {
					childPath := curPath + "/" + dir.Name()
					readFile(childPath)
				}

				fmt.Println(dir.Name())
			}
		}
	}
}

func main() {
	// defArg := "test"

 	if len(os.Args) != 2 {
 		_, _ = fmt.Fprint(os.Stderr, "argument error")
 		os.Exit(-1)
 	}

	readFile(os.Args[1])
}