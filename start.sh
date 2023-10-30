#!/bin/bash

# Load environment variables from the .env file
set -a
[ -f .env ] && . .env
set +a

# Substitute the placeholder with the environment variable value
export VOLUME_PREFIX=$VOLUME_PREFIX

# Substitute the placeholders in the template file and save it as docker-compose.yml
envsubst '${WP_VOLUME_NAME},${DB_VOLUME_NAME}}' \
    < docker-compose-template.yml > docker-compose.yml

# Run Docker Compose with the generated file
docker-compose up
