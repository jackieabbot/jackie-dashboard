#!/bin/bash
# API: Get system stats (CPU, memory, temperature, disk)

echo "Content-Type: application/json"
echo ""

# CPU usage
CPU=$(top -bn1 | grep "Cpu(s)" | sed "s/.*, *\([0-9.]*\)%* id.*/\1/" | awk '{print 100 - $1}')

# Memory usage
MEM_TOTAL=$(free -m | grep Mem | awk '{print $2}')
MEM_USED=$(free -m | grep Mem | awk '{print $3}')
MEM_PERCENT=$((MEM_USED * 100 / MEM_TOTAL))

# Disk usage
DISK=$(df -h / | tail -1 | awk '{print $5}' | sed 's/%//')

# Temperature (if available)
if [ -f /sys/class/thermal/thermal_zone0/temp ]; then
    TEMP=$(cat /sys/class/thermal/thermal_zone0/temp)
    TEMP=$((TEMP / 1000))
else
    TEMP="N/A"
fi

# Uptime
UPTIME=$(uptime -p)

# Gateway status
if pgrep -x "openclaw" > /dev/null; then
    GATEWAY_STATUS="running"
else
    GATEWAY_STATUS="stopped"
fi

# Tunnel status
if pgrep -x "cloudflared" > /dev/null; then
    TUNNEL_STATUS="running"
else
    TUNNEL_STATUS="stopped"
fi

# Output JSON
cat <<EOF
{
  "cpu": $CPU,
  "memory": {
    "total_mb": $MEM_TOTAL,
    "used_mb": $MEM_USED,
    "percent": $MEM_PERCENT
  },
  "disk_percent": $DISK,
  "temperature_c": $TEMP,
  "uptime": "$UPTIME",
  "gateway": "$GATEWAY_STATUS",
  "tunnel": "$TUNNEL_STATUS",
  "timestamp": "$(date -Iseconds)"
}
EOF
