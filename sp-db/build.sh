#!/bin/bash
# build-sp-db.sh
echo "Building sp-db image..."
docker build -t sp-db-arm64:latest .