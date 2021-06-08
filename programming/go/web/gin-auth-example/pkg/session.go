package pkg

import (
	"crypto/md5"
	"database/sql"
	"fmt"
	"github.com/gin-gonic/contrib/sessions"
"github.com/gin-gonic/gin"
"log"
"net/http"
	"time"
)

const (
	userkey = "user"
)

// gin session key
// const userkey = "user"

func EnableCookieSession() gin.HandlerFunc {
	// store := sessions.NewCookieStore([]byte("secret"))
	// store, _ := redis.NewStore(10, "tcp", "localhost:6379", "", []byte("secret"))
	store, err := sessions.NewRedisStore(10, "tcp",
		"localhost:6379", "", []byte("secret"))
	if err != nil {
		log.Fatalf("sessions.NewRedisStore: %v", err)
	}
	return sessions.Sessions("mysession", store)
}

func AuthSessionMiddle(c *gin.Context) {
	session := sessions.Default(c)
	sessionValue := session.Get("user")
	if sessionValue == nil {
		c.JSON(http.StatusUnauthorized, gin.H{
			"error": "Unauthorized",
		})
		c.Abort()
		return
	}
	c.Next()
	return
}

// func AuthRequired(c *gin.Context) {
//     session := sessions.Default(c)
//     user := session.Get("user")
//     if user == nil {
//         // Abort the request with the appropriate error code
//         c.AbortWithStatusJSON(http.StatusUnauthorized, gin.H{"error": "unauthorized"})
//         return
//     }
//     // Continue down the chain to handler etc
//     c.Next()
// }

func SaveAuthSession(c *gin.Context, username string) {
	session := sessions.Default(c)
	session.Set("user", username)
	err := session.Save()
	if err != nil {
		c.JSON(http.StatusInternalServerError, gin.H{"error": "failed to save session"})
	}
	c.JSON(http.StatusOK, gin.H{"message": "save session ok"})
}

func ClearAuthSession(c *gin.Context) {
	session := sessions.Default(c)
	session.Clear()
	session.Save()
}

func HasSession(c *gin.Context) bool {
	session := sessions.Default(c)
	if sessionValue := session.Get("userId"); sessionValue == nil {
		return false
	}
	return true
}

func GetSessionUserId(c *gin.Context) uint {
	session := sessions.Default(c)
	sessionValue := session.Get("userId")
	if sessionValue == nil {
		return 0
	}
	return sessionValue.(uint)
}

// func GetUserSession(c *gin.Context) map[string]interface{} {
//
//     hasSession := HasSession(c)
//     userName := ""
//     if hasSession {
//         userId := GetSessionUserId(c)
//         userName = models.UserDetail(userId).Name
//     }
//     data := make(map[string]interface{})
//     data["hasSession"] = hasSession
//     data["userName"] = userName
//     return data
// }


// AuthRequired is a simple middleware to check the session
func AuthRequired(c *gin.Context) {
	session := sessions.Default(c)
	user := session.Get(userkey)
	if user == nil {
		// Abort the request with the appropriate error code
		c.AbortWithStatusJSON(http.StatusUnauthorized, gin.H{"error": "unauthorized"})
		return
	}
	// Continue down the chain to handler etc
	c.Next()
}

func Login(c *gin.Context) {
	session := sessions.Default(c)

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
			c.String(http.StatusUnauthorized, "username or password wrong!")
		}
	}
	if passwordMd5Mysql != passwordMd5Form {
		c.String(http.StatusUnauthorized, "username or password wrong!")
		return
	}

	// Save the username in the session
	// session.Set(userkey, username) // In real world usage you'd set this to the users ID
	// if err := session.Save(); err != nil {
	// 	c.JSON(http.StatusInternalServerError, gin.H{"error": "Failed to save session"})
	// 	return
	// }
	// c.String(http.StatusOK, "Successfully authenticated user")

	// Save the username in the session
	session.Set(userkey, username) // In real world usage you'd set this to the users ID
	if err := session.Save(); err != nil {
		c.JSON(http.StatusInternalServerError, gin.H{"error": "Failed to save session"})
		return
	}
	c.String(http.StatusOK, "Login successful\n")
	c.String(http.StatusOK, "Redirect to home page")
	time.Sleep(1)
	c.Redirect(http.StatusMovedPermanently, "https://localhost:3333/")
}

func Logout(c *gin.Context) {
	session := sessions.Default(c)
	user := session.Get(userkey)
	if user == nil {
		c.String(http.StatusBadRequest, "Are you logged in?")
		return
	}
	session.Delete(userkey)
	if err := session.Save(); err != nil {
		c.JSON(http.StatusInternalServerError, gin.H{"error": "Failed to save session"})
		return
	}
	c.JSON(http.StatusOK, gin.H{"message": "Successfully logged out"})
}

func Me(c *gin.Context) {
	session := sessions.Default(c)
	user := session.Get(userkey)
	c.JSON(http.StatusOK, gin.H{"user": user})
}

func Status(c *gin.Context) {
	c.JSON(http.StatusOK, gin.H{"status": "You are logged in"})
}
