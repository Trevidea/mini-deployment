#!/bin/bash
# build-sp-coach-app.sh
echo "Building sp-coach-app image..."
cp ./.dockerignore ../../sp-coach-app/
cd ../../sp-coach-app
docker build -t drakesoftware/sp-coach-app:latest -f ../mini-deployment/sp-coach-app/Dockerfile .
rm ./.dockerignore