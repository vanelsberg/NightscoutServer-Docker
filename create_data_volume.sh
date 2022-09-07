#!/bin/bash

# Note:
# On RPI4/Ubuntu tested OS Docker only supported the "vfs" filesystem.
# Also "external volume" did not work!

nshome=/home/theo         # WSL2
#nshome=/home/tvelsberg     # RPI4

docker volume create --driver local \
    --opt type=none \
    --opt device=${nshome}/NS/mongodb/data \
    --opt o=bind mongodbdata
