package main

import (
	"fmt"
)

func main() {
	var startPort, stopPort int

	_, _ = fmt.Sscanf("100-200", "%d-%d", &startPort, &stopPort)

	fmt.Print(startPort, stopPort)
}