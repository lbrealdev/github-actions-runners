#!/bin/bash

set -o pipefail

function get_container_id() {
  docker_ids=$(docker ps -a --format '{{.ID}}')
}

# Delete all containers from this output.
if [ -n "$docker_ids" ]; then
  for container in $docker_ids; do
    echo "$container"
  done
else
  echo "Nof found!"
fi

