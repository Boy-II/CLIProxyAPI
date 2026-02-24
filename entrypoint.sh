#!/bin/sh
set -e

# Copy example config if config.yaml doesn't exist
if [ ! -f /CLIProxyAPI/config.yaml ]; then
  echo "No config.yaml found, copying from config.example.yaml..."
  cp /CLIProxyAPI/config.example.yaml /CLIProxyAPI/config.yaml
fi

# Create auth directory if it doesn't exist
mkdir -p /root/.cli-proxy-api

# Create logs directory if it doesn't exist
mkdir -p /CLIProxyAPI/logs

exec ./CLIProxyAPI "$@"
