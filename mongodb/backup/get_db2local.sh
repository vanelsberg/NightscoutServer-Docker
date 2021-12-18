#!/bin/bash
# Get database dump data on container to loacl storage

# Optionally: Copy container data local
echo "Getting data from container..."
docker cp mongodb1:./data ./

echo Done



