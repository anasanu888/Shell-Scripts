#!/bin/bash

# Log file path (change as needed)
LOG_FILE="/var/log/messages"

# Keyword to search in logs
KEYWORD="ERROR"

# Check if log file exists
if [ ! -f "$LOG_FILE" ]; then
    echo "❌ Log file not found: $LOG_FILE"
    exit 1
fi

# Search for the keyword
if grep -iq "$KEYWORD" "$LOG_FILE"; then
    echo "⚠️  Error detected in logs!"
    # Show last 10 matching lines
    grep -i "$KEYWORD" "$LOG_FILE" | tail -10
else
    echo "✅ No errors found in logs"
fi
