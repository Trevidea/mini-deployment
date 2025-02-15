#!/bin/bash
set -e

echo "Starting push of all microservice images..."

echo "1. Pushing full-stack service..."
docker push drakesoftware/full-stack-ui:latest

echo "2. Pushing llhls-server service..."
docker push drakesoftware/llhls-server:latest

echo "3. Pushing ome service..."
docker push drakesoftware/ome:latest

echo "4. Pushing relay-server service..."
docker push drakesoftware/relay-server:latest

echo "5. Pushing service-gateway service..."
docker push drakesoftware/service-gateway:latest

echo "6. Pushing sp-coach-app service..."
docker push drakesoftware/sp-coach-app:latest

echo "7. Pushing sp-db service..."
docker push drakesoftware/sp-db:latest

echo "8. Pushing tagging-app service..."
docker push drakesoftware/tagging-app:latest

echo "All images pushed successfully!"