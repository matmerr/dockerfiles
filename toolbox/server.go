package main

import (
	"fmt"
	"math/rand"
	"net"
	"os"
	"strconv"
	"strings"
	"time"
)

const (
	TCP     = "tcp"
	TCPPort = 8085
	UDP     = "udp"
	UDPPort = 8086
)

func main() {
	tcpPort, err := strconv.Atoi(os.Getenv("TCP_PORT"))
	if err != nil {
		tcpPort = TCPPort
		fmt.Printf("TCP_PORT not set, defaulting to port %d\n", TCPPort)
	}

	udpPort, err := strconv.Atoi(os.Getenv("UDP_PORT"))
	if err != nil {
		udpPort = UDPPort
		fmt.Printf("UDP_PORT not set, defaulting to port %d\n", UDPPort)
	}

	go ListenOnUDP(udpPort)
	ListenOnTCP(tcpPort)
}

func ListenOnTCP(port int) {

	listener, err := net.ListenTCP(TCP, &net.TCPAddr{Port: port})
	if err != nil {
		fmt.Println(err)
		return
	}
	fmt.Printf("[TCP] Listening on %+v\n", listener.Addr().String())
	defer listener.Close()
	rand.Seed(time.Now().Unix())

	for {
		connection, err := listener.Accept()

		if err != nil {
			fmt.Println(err)
			return
		}
		go handleConnection(connection)
	}
}

func handleConnection(connection net.Conn) {
	addressString := fmt.Sprintf("%+v", connection.RemoteAddr())
	fmt.Printf("[TCP] Received Connection from %s\n", addressString)
	connection.Write(getResponse(addressString, TCP))
	defer connection.Close()
}

func getResponse(addressString string, protocol string) []byte {
	hostname, _ := os.Hostname()
	interfaces, _ := net.Interfaces()
	var base string
	for _, iface := range interfaces {
		base += fmt.Sprintf("\t%+v\n", iface.Name)
		addrs, _ := iface.Addrs()
		for _, addr := range addrs {
			base += fmt.Sprintf("\t\t%+v\n", addr)
		}
	}
	res := fmt.Sprintf("Connected To: %s via %s\nConnected From: %v\nRemote Interfaces:\n%v", hostname, protocol, addressString, base)
	return []byte(res)
}

func ListenOnUDP(port int) {
	connection, err := net.ListenUDP(UDP, &net.UDPAddr{Port: port})
	if err != nil {
		fmt.Println(err)
		return
	}
	fmt.Printf("[UDP] Listening on %+v\n", connection.LocalAddr().String())

	defer connection.Close()
	buffer := make([]byte, 1024)
	rand.Seed(time.Now().Unix())

	for {
		n, addr, err := connection.ReadFromUDP(buffer)
		payload := strings.TrimSpace(string(buffer[0 : n-1]))

		if payload == "STOP" {
			fmt.Println("Exiting UDP server!")
			return
		}
		addressString := fmt.Sprintf("%+v", addr)
		fmt.Printf("[UDP] Received Connection from %s\n", addressString)
		_, err = connection.WriteToUDP(getResponse(addressString, UDP), addr)
		if err != nil {
			fmt.Println(err)
			return
		}
	}
}
