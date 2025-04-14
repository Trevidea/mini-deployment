#!/bin/bash
# build.sh - Script to build OME Docker image

echo "Building airflow Docker image for Mac server..."

# Stop on any error
set -e

# Build the Docker image
docker build -t drakesoftware/airflow-arm64:latest .

echo "Build completed successfully!"
