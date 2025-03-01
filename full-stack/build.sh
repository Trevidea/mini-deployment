#!/bin/bash
# build-full-stack.sh
echo "Building full-stack-ui image..."
# Adjust the relative path as needed.
cp ./.dockerignore ../../full-stack/
cd ../../full-stack
docker build -t drakesoftware/full-stack-ui:latest -f ../mini-deployment/full-stack/Dockerfile .
rm ./.dockerignore