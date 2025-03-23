#!/bin/bash
# build-tagging-app.sh
echo "Building tagging-app image..."
cp ./.dockerignore ../../tagging-app/
cd ../../tagging-app
docker build -t drakesoftware/tagging-app-arm64:latest -f ../mini-deployment/tagging-app/Dockerfile .
rm ./.dockerignore