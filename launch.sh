#!/bin/bash

# Ensure script is run from its own directory
cd "$(dirname "$0")"

# Colors for output
GREEN="\e[32m"
RED="\e[31m"
RESET="\e[0m"

# Remove old SSH known_hosts entry to avoid host key verification errors
KNOWN_HOSTS_FILE="$HOME/.ssh/known_hosts"
SSH_HOST="[127.0.0.1]:2222"

if [ -f "$KNOWN_HOSTS_FILE" ]; then
    echo -e "${GREEN}[INFO] Removing old SSH key for $SSH_HOST from known_hosts...${RESET}"
    ssh-keygen -f "$KNOWN_HOSTS_FILE" -R "$SSH_HOST" >/dev/null 2>&1 || {
        echo -e "${RED}[WARNING] Could not remove old SSH key entry.${RESET}"
    }
else
    echo -e "${GREEN}[INFO] No known_hosts file found, skipping SSH key removal.${RESET}"
fi

# Check if Ansible is installed
if ! command -v ansible-playbook &> /dev/null; then
    echo -e "${GREEN}[INFO] Ansible not found. Installing...${RESET}"
    # For Debian/Ubuntu
    if [ -f /etc/debian_version ]; then
        sudo apt update && sudo apt install -y ansible
    # For RedHat/CentOS
    elif [ -f /etc/redhat-release ]; then
        sudo yum install -y epel-release && sudo yum install -y ansible
    else
        echo -e "${RED}[ERROR] Unsupported OS. Install Ansible manually.${RESET}"
        exit 1
    fi
else
    echo -e "${GREEN}[INFO] Ansible is already installed.${RESET}"
fi

# Run the Ansible playbook
echo -e "${GREEN}[INFO] Running Ansible playbook...${RESET}"
ansible-playbook -i inventory.ini main.yaml --ask-become-pass

