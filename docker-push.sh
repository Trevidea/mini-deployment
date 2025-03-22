#!/bin/bash
set -e

echo "Starting push of all microservice images..."

echo "1. Pushing full-stack service..."
docker push drakesoftware/full-stack-ui-arm64:latest

echo "2. Pushing llhls-server service..."
docker push drakesoftware/llhls-server-arm64:latest

echo "3. Pushing ome service..."
docker push drakesoftware/ome-arm64:latest

echo "4. Pushing relay-server service..."
docker push drakesoftware/relay-server-arm64:latest

echo "5. Pushing service-gateway service..."
docker push drakesoftware/service-gateway-arm64:latest

echo "6. Pushing sp-coach-app service..."
docker push drakesoftware/sp-coach-app-arm64:latest

echo "7. Pushing sp-db service..."
docker push drakesoftware/sp-db-arm64:latest

echo "8. Pushing tagging-app service..."
docker push drakesoftware/tagging-app-arm64:latest

echo "All images pushed successfully!"