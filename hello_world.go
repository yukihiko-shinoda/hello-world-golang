// Command to print "hello world"
package main

import (
	"fmt"
	"log"
	"os"
)

func main() {
	fmt.Println("hello world")

	logger := log.New(os.Stdout, "myapp", log.LstdFlags)
	logger.Println("hello world")
}
