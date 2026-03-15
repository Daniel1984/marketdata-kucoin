#!/usr/bin/env bash

set -e  # Exit on error

# Update this version before each release
VERSION="0.1.0"

IMAGE_NAME="aciddaniel/marketdata-kucoin"
VERSION_TAG="${IMAGE_NAME}:${VERSION}"
LATEST_TAG="${IMAGE_NAME}:latest"

echo "======================================"
echo "  Building Docker Image"
echo "======================================"
echo ""
echo "Version: ${VERSION}"
echo "Tags: ${VERSION_TAG}, ${LATEST_TAG}"
echo ""

# Build the Docker image with version and latest tags using buildx
echo "Building..."
# docker buildx build --platform linux/amd64 --no-cache -t "${VERSION_TAG}" -t "${LATEST_TAG}" --push .
docker buildx build --platform linux/amd64 --no-cache -t "${LATEST_TAG}" --push .

echo ""
echo "✓ Build and publishing completed successfully"
echo "Images available at:"
# echo "  - ${VERSION_TAG}"
echo "  - ${LATEST_TAG}"
echo ""
