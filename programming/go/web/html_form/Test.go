// forms.go
package main

import (
    "fmt"
    "html/template"
    "log"
    "net/http"
)

type ContactDetails struct {
    Email   string
    Subject string
    Message string
}

func main() {
    tmpl := template.Must(template.ParseFiles("forms.html"))

    http.HandleFunc("/", func(w http.ResponseWriter, r *http.Request) {
        if r.Method != http.MethodPost {
            err := tmpl.Execute(w, nil)
            if err != nil {
                log.Fatalf("tmpl.Execute %v", err)
            }
            return
        }

        details := ContactDetails{
            Email:   r.FormValue("email"),
            Subject: r.FormValue("subject"),
            Message: r.FormValue("message"),
        }

        // do something with details
        _, err := fmt.Fprintf(w, "Your mail: %s", details.Email)
        if err != nil {
            log.Fatalf("fmt.Printf: %v", err)
        }

        err = tmpl.Execute(w, struct{ Success bool }{true})
        if err != nil {
            log.Fatalf("tmpl.Execute %v", err)
        }
    })

    http.ListenAndServe(":8080", nil)
}