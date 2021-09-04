package main

//#include<stdio.h>
import "C"
import "fmt"

func a() {
    i := 0
    defer fmt.Println(i)
    i++
    return
}

func main() {
//  	if len(os.Args) != 2 {
// 		log.Fatal("Argument error")
// 	}
//
// 	res, err := http.Get(os.Args[1])
// 	if err != nil {
// 		log.Fatal("http.Get")
// 	}
// 	body := res.Request.Body
// 	print(body)

    a()
}
