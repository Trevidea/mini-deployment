#!/bin/bash
# build-llhls-server.sh
echo "Building llhls-server image..."
cp ./.dockerignore ../../llhls-server/
cd ../../llhls-server
docker build -t drakesoftware/llhls-server:latest -f ../mini-deployment/llhls-server/Dockerfile .
rm ./.dockerignore