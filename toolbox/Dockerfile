FROM golang:1.14
RUN apt-get update
RUN apt-get install -y python3
RUN apt-get install -y nmap iptables ebtables sudo iproute2 curl wget axel jq ssh traceroute net-tools dnsutils netcat ncat ssh
ADD ./server.go /app/
WORKDIR /app 
RUN go build -o main .
CMD ["./main"]