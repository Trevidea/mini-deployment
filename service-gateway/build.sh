#!/bin/bash
# build-service-gateway.sh
echo "Building service-gateway image..."
cp ./.dockerignore ../../service-gateway/
cd ../../service-gateway
docker build -t service-gateway-arm64:latest -f ../mini-deployment/service-gateway/Dockerfile .
rm ./.dockerignore


