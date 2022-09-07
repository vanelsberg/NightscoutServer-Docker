#!/bin/bash

image=dev-nightscout
imageversion=14.0.3 # -> Is OK
# imageversion=14.2.4

# caching="--no-cache"

#docker build --tag "$image:$imageversion" --build-arg $buildargs .
docker build $caching --tag "$image:$imageversion" .

