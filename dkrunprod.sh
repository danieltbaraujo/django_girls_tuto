#!/bin/bash

docker build -t danielaraujo .
docker stop danielaraujo
docker run -d --rm -p 8000:8000 \
         --env-file $HOME/danielaraujo.env \
         --name danielaraujo \
         -v $(pwd)/dkdata:/dkdata \
         danielaraujo start.sh



