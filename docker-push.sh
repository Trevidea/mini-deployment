#!/bin/bash
set -e

# Define arrays with Docker image tags and descriptive names
images[1]="drakesoftware/full-stack-ui-arm64:latest"
# images[2]="drakesoftware/llhls-server-arm64:latest"
images[3]="drakesoftware/ome-arm64:latest"
images[4]="drakesoftware/relay-server-arm64:latest"
images[5]="drakesoftware/service-gateway-arm64:latest"
images[6]="drakesoftware/sp-coach-app-arm64:latest"
images[7]="drakesoftware/sp-db-arm64:latest"
images[8]="drakesoftware/tagging-app-arm64:latest"
images[9]="drakesoftware/airflow-arm64:latest"
images[10]="drakesoftware/keycloak-arm64:latest"

names[1]="full-stack service"
# names[2]="llhls-server service"
names[3]="ome service"
names[4]="relay-server service"
names[5]="service-gateway service"
names[6]="sp-coach-app service"
names[7]="sp-db service"
names[8]="tagging-app service"
names[9]="airflow service"
names[10]="keycloak service"

# Determine which indices to use: all if no arguments, or only the ones provided.
if [ "$#" -eq 0 ]; then
    indices=(1 3 4 5 6 7 8 9 10)
else
    indices=("$@")
fi

echo "Starting push of selected microservice images..."

# Loop over each index and push the corresponding image.
for index in "${indices[@]}"; do
    image=${images[$index]}
    name=${names[$index]}
    if [ -z "$image" ]; then
        echo "Invalid project number: $index"
        exit 1
    fi
    echo "$index. Pushing $name..."
    docker push "$image"
done

echo "All images pushed successfully!"