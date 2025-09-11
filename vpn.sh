#!/bin/bash

# Path to your OpenVPN config file
CONFIG_PATH="____"

# VPN username and password
USERNAME="____"
PASSWORD="____"

# Create a temporary credentials file
CRED_FILE=$(mktemp)
echo "$USERNAME" > $CRED_FILE
echo "$PASSWORD" >> $CRED_FILE

# Start OpenVPN using the credentials file
sudo openvpn --config "$CONFIG_PATH" --auth-user-pass $CRED_FILE

# Remove credentials file after VPN disconnects
rm -f $CRED_FILE
