#!/bin/sh
set -e

# Create config directory if it doesn't exist
mkdir -p /config

# Copy example config if config.yaml doesn't exist
if [ ! -f /config/config.yaml ]; then
  echo "No config.yaml found, copying from config.example.yaml..."
  cp /CLIProxyAPI/config.example.yaml /config/config.yaml
fi

# Create symlink to config.yaml
ln -sf /config/config.yaml /CLIProxyAPI/config.yaml

# Create auth directory if it doesn't exist
mkdir -p /root/.cli-proxy-api

# Create logs directory if it doesn't exist
mkdir -p /CLIProxyAPI/logs

exec ./CLIProxyAPI "$@"
