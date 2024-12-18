#!/bin/bash

USER_AGENT="stockbit-qa-a5586ef8-7ef0-4b5c-9b20"

ENDPOINTS=(
    "http://stockbit.com/login"
)

scan_endpoints() {
    for endpoint in "${ENDPOINTS[@]}"; do
        echo "Scanning $endpoint with User-Agent: $USER_AGENT"
        curl -s -o /dev/null -w "%{http_code}" -A "$USER_AGENT" "$endpoint"
        echo " - Done"
    done
}

echo "Starting QA scan with custom User-Agent..."
scan_endpoints
echo "Scan complete."