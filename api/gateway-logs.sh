#!/bin/bash
# API: Get recent gateway logs

LOG_FILE="/tmp/openclaw/openclaw-2026-02-19.log"

echo "Content-Type: text/plain"
echo ""

if [ -f "$LOG_FILE" ]; then
    tail -50 "$LOG_FILE" 2>/dev/null | grep -v "Config warnings" | tail -30
else
    echo "No logs found"
fi
