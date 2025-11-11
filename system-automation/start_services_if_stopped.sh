#!/bin/bash

# Script: Start services if not running
# Purpose: Ensures required services are active

read -p "Enter services to check (space separated): " -a services

for svc in "${services[@]}"
do
    if systemctl is-active --quiet "$svc"
    then
        echo "✅ Service $svc is already running"
    else
        echo "❌ Service $svc stopped — starting now..."
        sudo systemctl start "$svc"
        sudo systemctl enable "$svc"
        echo "✅ $svc started & enabled"
    fi
done
