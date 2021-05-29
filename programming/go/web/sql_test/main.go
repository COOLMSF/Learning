package main

import (
	"database/sql"
	"fmt"
	"log"
	
	_ "github.com/go-sql-driver/mysql"
)

func main() {
	db, err := sql.Open("mysql", "root:hushanglai@tcp(localhost:3306)/web")
	if err != nil {
		log.Fatal(err)
	}
	defer func(db *sql.DB) {
		err := db.Close()
		if err != nil {

		}
	}(db)

	res, err := db.Query("select * from user_passwd")
	if err != nil {
		log.Fatal(err)
	}
	defer func(res *sql.Rows) {
		err := res.Close()
		if err != nil {

		}
	}(res)

	for res.Next() {
		var username, password string

		err = res.Scan(&username, &password)
		if err != nil {
			log.Fatal(err)
		}

		fmt.Printf("Username: %s\tPassword: %s", username, password)
	}
}