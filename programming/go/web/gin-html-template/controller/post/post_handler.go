package post

import (
	"../../pkg"
	"crypto/md5"
	"database/sql"
	"fmt"
	"github.com/gin-gonic/gin"
	_ "github.com/go-sql-driver/mysql"
	"log"
	"net/http"
	"strings"
)

func Login(c *gin.Context) {

	tableName := "user_passwd"
	username := c.PostForm("username")
	password := c.PostForm("password")
	passwordMd5Form := fmt.Sprintf("%x", md5.Sum([]byte(password)))

	db, err := sql.Open("mysql", "root:hushanglai@tcp(localhost:3306)/web")
	if err != nil {
		log.Printf("sql.Open: %v", err)
	}
	defer func(db *sql.DB) {
		err := db.Close()
		if err != nil {
			log.Printf("Fail to close db:%v", err)
		}
	}(db)

	// Query password for a specified username
	sqlString := fmt.Sprintf("select password from %s where username=\"%s\"",
		tableName, username)

	res, err := db.Query(sqlString)
	defer func(res *sql.Rows) {
		err := res.Close()
		if err != nil {
			log.Printf("res.Close: %v", err)
		}
	}(res)
	if err != nil {
		log.Printf("db.Query: %v", err)
	}

	var passwordMd5Mysql string
	for res.Next() {
		err = res.Scan(&passwordMd5Mysql)
		if err != nil {
			// log.Fatalf("res.Scan: %v", err)
			c.String(http.StatusUnauthorized, "username or password wrong!")
		}
	}
	if passwordMd5Mysql != passwordMd5Form {
		c.String(http.StatusUnauthorized, "username or password wrong!")
		return
	}
	c.String(http.StatusOK, "Login successful")

	/*
	 * Save session
	 */
	pkg.SaveAuthSession(c, 123)
}

func Create(c *gin.Context) {

	err := c.Request.ParseForm()
	if err != nil {
		log.Printf("c.Request.ParseForm: %v", err)
	}

	/*
	 * Connect to mysql
	 */
	db, err := sql.Open("mysql", "root:hushanglai@tcp(localhost:3306)/web")
	if err != nil {
		log.Printf("sql.Open: %v", err)
	}
	defer func(db *sql.DB) {
		err := db.Close()
		if err != nil {
			log.Printf("Fail to close db:%v", err)
		}
	}(db)

	tableName := "user_passwd"
	field1 := "username"
	field2 := "password"
	username := c.PostForm("username")
	password := c.PostForm("password")

	/*
	 * Simple filter
	 */
	if username != "" && password != "" {
		if len(password) < 7 {
			c.String(http.StatusBadRequest, "Password less or equal than 7!")
			return
		}
		if !strings.ContainsAny(password, "./<>,()_+-=[]{}|") {
			c.String(http.StatusBadRequest, "Password must contains at least on special character!")
			return
		}
		
		/*
		 * Secure password with md5, need to add salt?
		 */
		password = fmt.Sprintf("%x", md5.Sum([]byte(password)))
		/*
		 * Store username and password to mysql
		 */
		// Sql injection?
		sqlString := fmt.Sprintf("insert into %s (%s, %s) values (\"%s\", \"%s\")",
			tableName, field1, field2, username, password)
		_, err = db.Exec(sqlString)
		if err != nil {
			log.Printf("create account in mysql: %v", err)
		}
	}

	_, err = fmt.Fprintf(c.Writer, "Created successful!\nBecareful with your password?")
	if err != nil {
		log.Print(err)
	}
}

func Upload(c *gin.Context) {

	file, _ := c.FormFile("file")
	log.Println(file.Filename)

	// Upload the file to specific dst.
	err := c.SaveUploadedFile(file, "upload/" + file.Filename)
	if err != nil {
		log.Printf("c.SaveUploadedFile: %v", err)
	}

	c.String(http.StatusOK, fmt.Sprintf("'%s' uploaded!", file.Filename))
}
