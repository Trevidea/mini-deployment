#!/bin/bash
# build.sh - Script to build Keycloak Docker image

echo "Building thumbnail image..."

# Stop on any error
set -e
# cd ../../thumbnail-service
pwd
docker build -t drakesoftware/thumbnail-arm64:latest -f Dockerfile .

echo "Thumbnail build completed successfully!"
