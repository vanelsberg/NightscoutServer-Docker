#!/bin/bash

# Change to directory where this script is running
pushd $(dirname $0)

# Stop NS
$dosudo docker compose -f docker-compose-rpi4.yml down

# Change to original directory
popd
