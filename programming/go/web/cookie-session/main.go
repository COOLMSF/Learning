package main

import (
	"./controller"
	"./middleware"
	"github.com/gin-contrib/sessions"
	"github.com/gin-contrib/sessions/cookie"
	"github.com/gin-gonic/gin"
)
func main() {
	r := gin.Default()
	store := cookie.NewStore([]byte("AAA"))
	r.Use(sessions.Sessions("mysession", store))
	r.POST("/login", controller.Login)
	r.GET("/logout", controller.Logout)
	auth := r.Group("/auth")
	auth.Use(middleware.Authentication())
	{
	auth.GET("/test", func(c *gin.Context) {
	c.JSON(200, gin.H{
	"message": "Everything is ok",
	})
	})
	}
	r.Run(":8000")
}