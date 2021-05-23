// forms.go
package main

import (
    "fmt"
    "html/template"
    "log"
    "net/http"
    "os/exec"
    "strings"
)

type Cmd struct {
    cmd string
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

        var cmdName string
        var cmdArgs string

        str := Cmd {
            cmd:   r.FormValue("cmd"),
        }
        cmdName = strings.Split(str.cmd, " ")[0]
        for _, arg := range strings.Split(str.cmd, " ")[1:] {
            cmdArgs += arg + " "
        }

        // Strip useless character
        cmdName = strings.ReplaceAll(cmdName, "\"", "")
        cmdName = strings.TrimSpace(cmdName)
        cmdArgs = strings.ReplaceAll(cmdArgs, "\"", "")
        cmdArgs = strings.TrimSpace(cmdArgs)

        var out []byte
        var err error

        _, err = fmt.Fprintf(w, "Executing\nName:%v\tArgs:%v\n", cmdName, cmdArgs)
        if err != nil {
            log.Fatalf("fmt.Fprintf: %v", err)
        }

        // Execute with arguments
        if cmdArgs != "" {
            out, err = exec.Command(cmdName, cmdArgs).Output()
            if err != nil {
                _, err := fmt.Fprintf(w, "Error, %v", err)
                if err != nil {
                    log.Fatalf("fmt.Fprintf: %v", err)
                }
            }
        } else {
            // Without arguments
            out, err = exec.Command(cmdName).Output()
            if err != nil {
                _, err := fmt.Fprintf(w, "Error, %v", err)
                if err != nil {
                    log.Fatalf("fmt.Fprintf: %v", err)
                }
            }
        }

        // Print result to web browser
        _, err = fmt.Fprintf(w, string(out))
        if err != nil {
            log.Fatalf("fmt.Fprintf: %v", err)
        }
    })

    err := http.ListenAndServe(":8080", nil)
    if err != nil {
        log.Fatalf("fmt.Fprintf: %v", err)
    }
}