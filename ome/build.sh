#!/bin/bash
# build-llhls-server.sh
echo "Building OME image..."
docker build -t drakesoftware/ome-arm64:latest .