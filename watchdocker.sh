#!/bin/bash

set -eo pipefail

# Get all containers by .ID
function docker_get_container_id() {
  docker_container_ids=$(docker ps -a --format '{{.ID}}')
}

function docker_remove_container_id() {
  local container_id=$1
  docker rm -f "$container_id"
}

function main() {
  docker_get_container_id
  # Remove all containers.
  if [ -n "$docker_container_ids" ]; then
    for container_id in $docker_container_ids; do
      echo "$container_id"
      docker_remove_container_id "$container_id"
    done
  else
    echo "No containers found!"
  fi
}

main
