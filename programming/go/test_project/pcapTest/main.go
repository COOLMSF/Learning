package main

import (
	"fmt"
	"github.com/google/gopacket"
	"github.com/google/gopacket/pcap"
	"log"
	"net"
	"time"
)

func main() {
	var interfaceIdx int
	// get all interfaces
	interfaces, err := net.Interfaces()
	if err != nil {
		log.Fatal(err)
	}

	// show menu
	for _, i := range interfaces {
		fmt.Printf("%d -> %s\n", i.Index, i.Name)
	}
	fmt.Print("Choose an interface:")
	// get index
	_, err = fmt.Scanf("%d", &interfaceIdx)
	if err != nil {
		log.Fatal(err)
	}

	handle, err := pcap.OpenLive(interfaces[interfaceIdx - 1].Name, 1024, false, time.Second)
	if err != nil {
		log.Fatal(err)
	}

	// read data from handle
	packetSource := gopacket.NewPacketSource(handle, handle.LinkType())
	for packet := range packetSource.Packets() {
		if networkLayer := packet.NetworkLayer(); networkLayer != nil {
			src, dst := networkLayer.NetworkFlow().Endpoints()
			fmt.Printf("[+] src:%v -> dst:%v\n", src, dst)
		}
	}
	handle.Close()
}
