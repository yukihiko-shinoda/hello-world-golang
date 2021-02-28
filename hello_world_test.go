package main

import (
	"bytes"
	"io"
	"log"
	"os"
	"regexp"
	"testing"
)

// see:
//   - Answer: In Go, how do I capture stdout of a function into a string?
//     https://stackoverflow.com/a/10476304/12721873
func TestHelloWorld(t *testing.T) {
	old := os.Stdout // keep backup of the real stdout
	r, w, err := os.Pipe()
	if err != nil {
		log.Fatal(err)
	}

	os.Stdout = w

	outC := make(chan string)
	// copy the output in a separate goroutine so printing can't block indefinitely
	go func() {
		var buf bytes.Buffer
		_, err := io.Copy(&buf, r)
		if err != nil {
			t.Errorf("copy &buf r: %v", err)
		}
		outC <- buf.String()
	}()

	main()

	// back to normal state
	w.Close()
	os.Stdout = old // restoring the real stdout
	output := <-outC

	re := regexp.MustCompile(`hello\sworld\nmyapp\d{4}/\d{2}/\d{2}\s\d{2}:\d{2}:\d{2}\shello\sworld\n`)
	// reading our temp stdout
	match := re.FindStringSubmatch(output)
	if len(match) != 1 {
		t.Errorf("main() outputs %s; want \"\\hello\\sworld\\nmyapp.*hello\\sworld\\n\"", output)
	}
}
