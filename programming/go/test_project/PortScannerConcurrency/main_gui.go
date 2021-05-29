package main

import (
	"log"

	"fyne.io/fyne/v2/app"
	"fyne.io/fyne/v2/container"
	"fyne.io/fyne/v2/widget"
)

func main() {
	myApp := app.New()
	myWindow := myApp.NewWindow("Entry Widget")

	host := widget.NewEntry()
	host.SetPlaceHolder("Host")
	port := widget.NewEntry()
	port.SetPlaceHolder("Port range")
	thread := widget.NewEntry()
	thread.SetPlaceHolder("N threads")

	content := container.NewVBox(host, port, thread, widget.NewButton("Scan", func() {
		log.Println("Host:", host.Text)
		log.Println("Port:", port.Text)
		log.Println("NThread:", thread.Text)
	}))

	myWindow.SetContent(content)
	myWindow.ShowAndRun()
}
