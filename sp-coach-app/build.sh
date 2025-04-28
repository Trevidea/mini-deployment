#!/bin/bash
# build-sp-coach-app.sh
echo "Building sp-coach-app image for Mac..."

# Navigate to the application directory
cp ./.dockerignore ../../sp-coach-app/
cp ./entrypoint.sh ../../sp-coach-app/

cd ../../sp-coach-app 
docker build -t drakesoftware/sp-coach-app-arm64:latest -f ../mini-deployment/sp-coach-app/Dockerfile .
# Clean up
rm ./.dockerignore
rm ./entrypoint.sh

echo "Docker image for mac built successfully!"