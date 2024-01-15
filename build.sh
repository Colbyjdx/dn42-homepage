#!/bin/bash
# This script is used to build the project, output directory is ./public

# Required environment variables:
# - TILES_URL: URL to download tiles tarball from
# - TILES_FILE: Name of the tiles tarball file
# - HUGO_ENV: Environment to build for (production, staging development)
# Optional environment variables:
# - CF_PAGES_URL: URL of the Cloudflare Pages deployment

# Load environment variables if .env file exists
[ -f .env ] && export $(cat .env | xargs)

# Assert that all required env variables are set
[ -z "$TILES_URL" ] && echo "TILES_URL is required" && exit 1;
[ -z "$TILES_FILE" ] && echo "TILES_FILE is required" && exit 1;
[ -z "$HUGO_ENV" ] && echo "HUGO_ENV is required" && exit 1;

# Update all submodules to latest
git submodule update --init --recursive
echo "Submodules updated"

# Install npm packages
npm install
echo "NPM packages installed"

# Download tiles
curl -C - -o $TILES_FILE $TILES_URL
echo "Tiles downloaded"
tar -xzf $TILES_FILE -C ./static/
echo "Tiles extracted"

# Check if HUGO_ENV is "production"
if [ "$HUGO_ENV" == "production" ]; then
    HUGO_FLAGS+=" --minify"
fi

# Check if CF_PAGES_URL is defined
if [ -n "$CF_PAGES_URL" ]; then
    HUGO_FLAGS+=" -b $CF_PAGES_URL"
fi

hugo $HUGO_FLAGS

echo "Project built!"
