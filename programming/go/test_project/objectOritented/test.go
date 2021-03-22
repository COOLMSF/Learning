package main

import "fmt"

type Person struct {
	id int
	age int
	name string
	gender string
}

func (person *Person)setName(name string) {
	person.name = name
}

func (person Person)getName() string{
	return person.name
}

func main() {
	stu := make([]Person, 3)

	for idx, val := range stu {
		val.setName("coolder" + string(rune(idx)))
	}

	for idx, val := range stu {
		fmt.Printf("idx:%d, name:%s\n", idx, val.getName())
	}
}
