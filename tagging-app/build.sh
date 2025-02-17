#!/bin/bash
# build-tagging-app.sh
echo "Building tagging-app image..."
cp ./.dockerignore ../../mob-tagging-app/
cd ../../mob-tagging-app
docker build -t drakesoftware/tagging-app:latest -f ../mini-deployment/tagging-app/Dockerfile .
rm ./.dockerignore