package main

import (
	"./controller/get"
	"./controller/post"
	"./model"
	"github.com/gin-gonic/contrib/sessions"
	"github.com/gin-gonic/gin"
	"log"
	"net/http"
)

func main() {
	r := engine()
	r.Use(gin.Logger())
	if err := engine().RunTLS(":3333", "server.crt", "server.key"); err != nil {
		log.Fatal("Unable to start:", err)
	}
}

func engine() *gin.Engine {
	r := gin.New()

	// store, err := sessions.NewRedisStore(10, "tcp", "localhost:6379", "", []byte("secret"))
	// if err != nil {
	// 	log.Fatalf("sessions.NewRedisStore: %v", err)
	// }
	r.Use(sessions.Sessions("mysession", sessions.NewCookieStore([]byte("secret"))))
	// r.Use(sessions.Sessions("mysession", store))

	r.LoadHTMLGlob("view/*")

	r.GET("/", get.RenderIndex)
	r.GET("/view/login.html", get.RenderLogin)
	r.GET("/view/create.html", get.RenderCreate)
	r.GET("/view/upload.html", get.RenderUpload)
	r.GET("/view/gif.html", get.RenderGif)
	r.GET("/view/webshell.html", get.RenderWebshell)
	r.GET("/view/playground.html", get.RenderPlayground)
	r.GET("/logout", model.Logout)

	r.POST("/login", model.Login)
	r.POST("/playground", post.Playground)
	r.POST("/gif", post.Gif)
	r.POST("/create", post.Create)

	private := r.Group("/private")
	// private.Use(AuthRequired)
	private.Use(model.AuthSessionMiddle)
	{
		private.GET("/status", model.Status)
		private.GET("/me", model.Me)
		private.GET("/logout", model.Logout)
		private.POST("/upload", post.Upload)
		private.POST("/webshell", post.WebShell)
		private.StaticFS("/download", http.Dir("download"))
	}
	return r
}
