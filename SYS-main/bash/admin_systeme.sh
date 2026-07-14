#!/bin/bash

# CHECK ROOT
if [ "$EUID" -ne 0 ]; then
    echo "Please run as root (sudo)"
    exit 1
fi

echo "=== SYSTEM ADMINISTRATION SCRIPT ==="

# USER INPUT
read -p "Enter username to create: " username

if [ -z "$username" ]; then
    echo "Error: Username cannot be empty."
    exit 1
fi

user_dir="/home/$username"
workspace_dir="$user_dir/workspace"

echo "Creating user account: $username..."
echo "Setting up workspace directory structure..."

mkdir -p "$workspace_dir"

# SET PERMISSIONS
echo "Configuring secure workspace permissions..."
chmod 700 "$user_dir"
chmod 700 "$workspace_dir"

# QUOTA (SIMULATED)
echo "Simulating disk quota assignment..."
echo "User $username assigned 100MB quota (simulation)"

# SUMMARY
echo "=== SUMMARY ==="
echo "User: $username"
echo "Home: $user_dir"
echo "Workspace: $workspace_dir"
echo "Permissions: 700 (owner only)"
echo ""
echo "Script execution completed successfully."
