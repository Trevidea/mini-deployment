#!/bin/bash
# build-llhls-server.sh
echo "Building OME image..."
docker build -t ome-arm64:latest .