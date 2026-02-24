#!/bin/sh
set -e

# Create config directory if it doesn't exist
mkdir -p /config

# Create symlink first (before checking if file exists)
ln -sf /config/config.yaml /CLIProxyAPI/config.yaml

# Copy example config if config.yaml doesn't exist
if [ ! -f /config/config.yaml ]; then
  echo "No config.yaml found, copying from config.example.yaml..."
  cp /CLIProxyAPI/config.example.yaml /config/config.yaml
fi

# Create auth directory if it doesn't exist
mkdir -p /root/.cli-proxy-api

# Create logs directory if it doesn't exist
mkdir -p /CLIProxyAPI/logs

exec ./CLIProxyAPI "$@"
