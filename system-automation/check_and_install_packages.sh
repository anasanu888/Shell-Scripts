#!/bin/bash

# Script: Check and Install Packages on Linux
# Purpose: Checks whether a package exists, if not installs it
# Works on: RHEL/CentOS/Amazon Linux (yum package manager)

read -p "Enter packages to verify/install (space separated): " -a packages

for pkg in "${packages[@]}"
do
    echo "Checking package: $pkg"

    if rpm -q "$pkg" &> /dev/null
    then
        echo "✅ $pkg is already installed"
    else
        echo "❌ $pkg not installed"
        echo "📦 Installing $pkg ..."
        sudo yum install -y "$pkg"
    fi
done

echo "✅ Script Completed"
