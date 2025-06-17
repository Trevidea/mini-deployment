#!/bin/bash
set -e

# Define an array with project directories indexed starting from 1.
projects[1]="full-stack"
# projects[2]="llhls-server"
projects[3]="ome"
projects[4]="relay-server"
projects[5]="service-gateway"
projects[6]="sp-coach-app"
projects[7]="sp-db"
projects[8]="tagging-app"
projects[9]="airflow"
projects[10]="keycloak"
projects[11]="thumbnail-service"

# If no arguments are provided, build all projects.
if [ "$#" -eq 0 ]; then
    indices=(1 3 4 5 6 7 8 11)
else
    indices=("$@")
fi

echo "Starting build of selected microservice images..."

# Loop through each index provided (or all if none were provided).
for index in "${indices[@]}"; do
    project=${projects[$index]}
    if [ -z "$project" ]; then
        echo "Invalid project number: $index"
        exit 1
    fi

    echo "Building $project service..."
    cd "$project" && ./build.sh && cd ..
done

echo "All selected images built successfully!"