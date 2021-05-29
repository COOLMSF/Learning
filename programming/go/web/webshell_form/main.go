// forms.go
package main

import (
    "coolder.com/webshell_form/webshell_form"
    "log"
    "net/http"
)

func main() {
    http.HandleFunc("/", webshell_form.WebShell)
    err := http.ListenAndServe(":8080", nil)
    if err != nil {
        log.Fatalf("fmt.Fprintf: %v", err)
    }
}