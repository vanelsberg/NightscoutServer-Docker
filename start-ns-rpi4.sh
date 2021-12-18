#!/bin/bash

# Change to directory where this script is running
pushd $(dirname $0)

# Start NS
sudo docker-compose -f docker-compose-rpi4.yml up -d
# Show containers
docker container ls

# Change to original directory
popd
