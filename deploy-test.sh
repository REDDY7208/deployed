#!/bin/bash

# Deploy Test Script
# Based on .gitlab-ci.yml configuration

set -e  # Exit on error

# Set timeout variables
export COMPOSE_HTTP_TIMEOUT=300
export DOCKER_CLIENT_TIMEOUT=300

echo "=========================================="
echo "Starting TEST Deployment"
echo "=========================================="

echo "Stopping and removing existing TEST containers..."
docker-compose -f Docker-Compose-Test/docker-compose.frontend.yml \
               -f Docker-Compose-Test/docker-compose.backend.yml \
               -f Docker-Compose-Test/docker-compose.nginx.yml \
               down --remove-orphans

echo "Starting TEST containers with local images..."
docker-compose -f Docker-Compose-Test/docker-compose.frontend.yml \
               -f Docker-Compose-Test/docker-compose.backend.yml \
               -f Docker-Compose-Test/docker-compose.nginx.yml \
               up -d --force-recreate --remove-orphans

echo "Listing running containers..."
docker ps -a

echo "=========================================="
echo "Test deployment completed successfully."
echo "=========================================="
