#!/bin/bash
# build.sh - Script to build Keycloak Docker image

echo "Building Keycloak Docker image..."

# Stop on any error
set -e

docker build -t drakesoftware/keycloak-arm64:latest .

echo "Keycloak build completed successfully!"
