package main

import (
	"fmt"
	"log"
	"net/http"
)

func helloServer(w http.ResponseWriter, r *http.Request) {
	_, err := fmt.Fprintf(w, "%s", "Hello, world.")
	if err != nil {
		fmt.Printf("fmt.Fprintf:%v", err)
	}
}

func main() {
	http.HandleFunc("/", helloServer)
	err := http.ListenAndServeTLS(":4430", "server.crt", "server.key", nil)
	if err != nil {
		log.Fatalf("http.ListenAndServeTLS:%v", err)
	}
}