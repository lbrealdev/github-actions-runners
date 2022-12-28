#!/bin/bash

# Delete all containers from this output.
for container in $(docker ps -a --format '{{.ID}}'); do
  echo "$container"
done
