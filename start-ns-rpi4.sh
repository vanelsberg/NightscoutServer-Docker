#!/bin/bash

if [ "$1" == "service" ];
then
  param1=""
else
  param1="-d"
fi;

# Change to directory where this script is running
pushd $(dirname $0)

# Start NS
$dosudo docker compose --verbose -f docker-compose-rpi4.yml up $param1

# Show containers
$dosudo docker container ls

# Change to original directory
popd

exit 0
