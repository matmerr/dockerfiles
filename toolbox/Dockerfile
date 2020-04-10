FROM ubuntu:18.04
RUN apt-get update
RUN apt-get install -y python3
RUN apt-get install -y nmap iptables ebtables sudo iproute2 curl wget axel jq ssh traceroute net-tools dnsutils netcat ssh
CMD ["/bin/bash", "-c", "ncat --exec \"/bin/echo $(date) -- Response from: $(hostname)\" -kvlp 80"]
