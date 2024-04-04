#!/bin/bash

# Script Location
myscripts="$HOME/MyScripts"

# Where new files will get saved to
output="$HOME/Network"

# Checks if Network directory exists
mkdir -p "$output"

# File created after script is run
file="$output/network_info_$(date +"%Y-%m-%d_%H-%M-%S").log"

# Logs info to file
log() {
	echo "[$(date +"%Y-%m-%d %T")] $1" >> "$file"
}

# Obtains and Logs IP
log "IPv4 address: $(hostname -I | cut -d' ' -f1)"

log "IPv6 address: $(hostname -I | cut -d' ' -f2)"

log "Public IP: $(curl -s ifconfig.me)"


# Obtains and Logs DNS
log "DNS Servers:"

log "$(cat /etc/resolv.conf)"

# Obtains and Logs Network interfaces
log "Network Interfaces:"

log "$(ip addr)"

# Obtains & Logs Routing info
log "Routing Information:"

log "$(ip route)"

# Obtains and Logs Open ports
log "Open Ports:"

log "$(ss -tuln)"

# Conducts and logs a speed test
log "Speed Test:"

log "$(speedtest-cli --simple)"

# Obtain & Log Packet Loss
log "Packet Loss:"
log "$(ping -c 5 google.com)"

# Obtain & Log Network Activity
log "Hostname: $(hostname)"

log "Domain: $(hostname -d)"

echo "Network Information has been logged to $file"
