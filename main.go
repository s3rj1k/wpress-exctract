package main

import (
	"log"
	"os"

	"github.com/yani-/wpress"
)

func main() {
	if len(os.Args) != 2 {
		log.Fatal("Please provide the path to the .wpress file as the first argument!")
	}

	archive, err := wpress.NewReader(os.Args[1])
	if err != nil {
		log.Fatal(err)
	}

	_, err = archive.Extract()
	if err != nil {
		log.Fatal(err)
	}
}
