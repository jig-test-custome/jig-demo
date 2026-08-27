package main

import "fmt"
import "os"

// Handler is completely unformatted - jig will auto-format this
func handler(w http.ResponseWriter, r *http.Request) {
	fmt.Fprintf(w, "Hello %s", r.URL.Path)
}

func main() {
	fmt.Println("Starting server on :8080")
	os.Exit(0)
}
