package main

func testFun() {
	// defer is like deconstructor, used to close a socket, close file, release data
	defer print("This is just a test")

	for i := 0; i < 100; i++ {
	}
}

func main() {
	testFun()
}