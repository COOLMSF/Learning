package main

import (
	"io/ioutil"
	"log"
	"mvdan.cc/xurls/v2"
	"net/http"
	"regexp"
)

type urlInfo struct {
	url       string
	isScanned bool
}

func readUrl(url urlInfo) {
	if !url.isScanned && isWebsite(url.url) {
		resp, err := http.Get(url.url)
		// Can open url
		if err == nil {
			bodyBuff, err := ioutil.ReadAll(resp.Body)
			if err != nil {
				log.Fatal("ioutil.ReadAll()")
			}
			rxStrict := xurls.Strict()
			// Get all urls in http body
			urls := rxStrict.FindAllString(string(bodyBuff), -1)
			// Append urls and status to allUrls
			for _, url := range urls {
				allUrls = append(allUrls, urlInfo{url: url, isScanned: false})
			}

			// Set scanned flag
			for idx, i := range allUrls {
				if i.url == url.url {
					allUrls[idx].isScanned = true
				}
			}
		}
	}
}

func isPicture(filename string) bool {
	regexpPic := regexp.MustCompile(".*(\\.png|\\.jpg|\\.gif)$")

	result := regexpPic.FindString(filename)
	if result != "" {
		return true
	}
	return false
}

func isVideo(str string) bool {
	regexpVideo := regexp.MustCompile(".*(\\.mp4|\\.avi)$")
	result := regexpVideo.FindString(str)
	if result != "" {
		return true
	}
	return false
}

func isAudio(str string) bool {
	regexpAudio := regexp.MustCompile(".*(\\.mp3)$")
	result := regexpAudio.FindString(str)
	if result != "" {
		return true
	}
	return false
}

func isHTML(str string) bool {
	regexpHTML := regexp.MustCompile(".*(\\.htm|\\.html)$")
	result := regexpHTML.FindString(str)
	if result != "" {
		return true
	}
	return false
}

func isWebsite(str string) bool {
	if !isPicture(str) || !isVideo(str) || !isAudio(str) {
		return true
	}
	return false
}

func getPicture(picture string, location string) {
}

func urlFilter() []urlInfo {
	filteredUrlInfo := make([]urlInfo, 1)
	for _, url := range allUrls {
		if isWebsite(url.url) {
			filteredUrlInfo = append(filteredUrlInfo, url)
		}
	}
	return filteredUrlInfo
}
