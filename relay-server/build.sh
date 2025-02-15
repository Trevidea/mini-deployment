#!/bin/bash
# build-llhls-server.sh
echo "Building relay-server image..."
cp ./.dockerignore ../../relay-server/
cd ../../relay-server
docker build -t drakesoftware/relay-server:latest -f ../mini-deployment/relay-server/Dockerfile .
rm ./.dockerignore