package main

import (
	"coolder.com/webshell"
	"log"
	"net/http"
)

func main() {
	http.HandleFunc("/", webshell.Handle)
	err := http.ListenAndServe("localhost:8080", nil)
	if err != nil {
		log.Fatal(err)
	}
}
