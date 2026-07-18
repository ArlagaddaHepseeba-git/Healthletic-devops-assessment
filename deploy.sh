#!/bin/bash

set -e

LOG_FILE="deployment.log"

ENVIRONMENT=$1
VERSION=$2
IMAGE_REGISTRY=$3

log() {
    echo "$(date '+%Y-%m-%d %H:%M:%S') : $1" | tee -a $LOG_FILE
}

rollback() {
    log "Deployment failed. Rolling back..."
    helm rollback backend || true
}

trap rollback ERR

if [ $# -ne 3 ]; then
    echo "Usage: ./deploy.sh <environment> <version> <image_registry>"
    exit 1
fi

if [[ "$ENVIRONMENT" != "dev" && "$ENVIRONMENT" != "test" && "$ENVIRONMENT" != "prod" ]]; then
    echo "Invalid environment."
    exit 1
fi

log "Starting deployment..."

helm lint flask-api

helm upgrade --install backend flask-api \
    --set image.repository=$IMAGE_REGISTRY \
    --set image.tag=$VERSION \
    --wait

kubectl rollout status deployment/backend

log "Deployment completed successfully."
