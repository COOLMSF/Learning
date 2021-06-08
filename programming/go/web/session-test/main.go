package main

import (
	"github.com/gin-contrib/sessions"
	"github.com/gin-contrib/sessions/cookie"
	"github.com/gin-gonic/gin"
	"net/http"
)

func main() {
	r := gin.Default()
	store := cookie.NewStore([]byte("AAA"))
	r.Use(sessions.Sessions("mysession", store))

	r.GET("/session", func(c *gin.Context) {
		session := sessions.Default(c)

		if session.Get("user") != "hushanglai" {
			session.Set("user", "hushanglai")
			session.Save()
			c.JSON(http.StatusUnauthorized, gin.H{"user": session.Get("user")})
		} else {
			c.String(http.StatusOK, "OK")
		}
	})

	r.Run(":8888")
}
