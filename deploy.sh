#!/usr/bin/env bash

# Update package list and install Node.js and npm
sudo apt update && sudo apt install -y nodejs npm

# Install pm2, a process manager for Node.js
sudo npm install -g pm2

# Stop any running instance of the application
pm2 stop simple_app

# Install application dependencies
npm install || true

# Store private key and server certificate
echo "$PRIVATE_KEY" > privatekey.pem
echo "$SERVER" > server.crt

# Start the application with pm2
pm2 start ./bin/www --name simple_app
