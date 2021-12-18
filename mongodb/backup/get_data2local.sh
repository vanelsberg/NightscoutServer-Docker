#!/bin/bash
# Get database dump data on container to local storage

echo "Getting data from container..."
docker cp mongodb1:./data ./

echo Done



