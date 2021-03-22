package main

import (
    "flag"
    "fmt"
    "io/ioutil"
    "log"
    "mvdan.cc/xurls/v2"
    "net/http"
  //  "net/url"
    "os"
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

func isValidUrl(toTest string) bool {
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

func isText(str string) bool {
    regexpText := regexp.MustCompile(".*(\\.txt|\\.js|\\.php)$")
    result := regexpText.FindString(str)
    if result != "" {
        return true
    }
    return false
}

func canClaw(str string) bool {
    if isHTML(str) {
        return true
    }
    if isPicture(str) || isVideo(str) || isAudio(str) || isText(str) {
        return false
    }
    return true
}

func getPicture(picture string, location string) {
}

func urlFilter() []urlInfo {
    filteredUrlInfo := make([]urlInfo, 1)
    for _, url := range allUrls {
        if canClaw(url.url) {
            filteredUrlInfo = append(filteredUrlInfo, url)
        }
    }
    return filteredUrlInfo
}

var allUrls = make([]urlInfo, 0x1)

func main() {
    urlPtr := flag.String("url", "", "url to claw")
    nThreadPtr := flag.Int("nThread", 1, "N threads to claw")
    nDepthPtr := flag.Int("nDepth", 1, "max depth to claw")
    flag.Parse()

    url := *urlPtr
    nDepth := *nDepthPtr
    nThread := *nThreadPtr

    // Url must be specified
    if url == "" {
        flag.Usage()
        os.Exit(-1)
    }

    allUrls[0].url = url
    // Scan all urls
    for i := 1; i <= nDepth; i++ {
        for _, url := range allUrls {
            go readUrl(url)
        }
        // Filter unnecessary data
        allUrls = urlFilter()
    }

    for _, i := range allUrls {
        fmt.Println(i.url)
    }
 }