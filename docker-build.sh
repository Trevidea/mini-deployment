#!/bin/bash
set -e

echo "Starting build of all microservice images..."

echo "Building full-stack service..."
cd full-stack && ./build.sh && cd ..

echo "Building llhls-server service..."
cd llhls-server && ./build.sh && cd ..

echo "Building ome service..."
cd ome && ./build.sh && cd ..

echo "Building relay-server service..."
cd relay-server && ./build.sh && cd ..

echo "Building service-gateway service..."
cd service-gateway && ./build.sh && cd ..

echo "Building sp-coach-app service..."
cd sp-coach-app && ./build.sh && cd ..

echo "Building sp-db service..."
cd sp-db && ./build.sh && cd ..

echo "Building tagging-app service..."
cd tagging-app && ./build.sh && cd ..

echo "All images built successfully!"