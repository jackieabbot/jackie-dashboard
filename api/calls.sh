#!/bin/bash
# API: Get call logs
# Returns JSON array of recent calls (sanitized - no phone numbers)

CALL_LOG="/home/jackie/.openclaw/voice-calls/calls.jsonl"

echo "Content-Type: application/json"
echo ""

if [ -f "$CALL_LOG" ]; then
    # Extract and sanitize call records
    # Remove actual phone numbers, replace with placeholder
    tail -20 "$CALL_LOG" 2>/dev/null | while read line; do
        echo "$line" | sed 's/+1[0-9]\{10\}/+1XXX/g' | sed 's/[0-9]\{10\}/XXXX/g'
    done | jq -s '.' 2>/dev/null || echo "[]"
else
    echo "[]"
fi
