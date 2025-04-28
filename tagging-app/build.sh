#!/bin/bash
# build-tagging-app-linux.sh

echo "Building tagging-app image for Mac..."

# Navigate to the tagging-app project directory
cp ./.dockerignore ../../tagging-app/
cp ./entrypoint.sh ../../tagging-app/

cd ../../tagging-app
docker build -t drakesoftware/tagging-app-arm64:latest -f ../mini-deployment/tagging-app/Dockerfile .

# Clean up
rm ./.dockerignore
rm ./entrypoint.sh