#!/bin/bash
# build-llhls-server.sh
echo "Building llhls-server image..."
cp ./.dockerignore ../../llhls-server/
cd ../../llhls-server
docker build -t llhls-server-arm64:latest -f ../mini-deployment/llhls-server/Dockerfile .
rm ./.dockerignore