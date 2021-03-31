package main

import (
	"crypto/sha512"
	"encoding/hex"
	"fmt"
)

func main() {
	hash := sha512.New512_224()
	salt := "$6$OMOrF7mE$"
	hash.Write([]byte("hushanglai" + salt))
	sha := hash.Sum(nil)
	shaStr := hex.EncodeToString(sha)
	fmt.Println(shaStr)
}
