#!/bin/bash

image=dev-nightscout
imageversion=14.2.3
buildargs=$imageversion

docker build --tag "$image:$imageversion" --build-arg $buildargs .

