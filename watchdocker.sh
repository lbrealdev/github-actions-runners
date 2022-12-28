#!/bin/bash

set -o pipefail

# Get all containers by .ID
function get_container_id() {
  docker_container_ids=$(docker ps -a --format '{{.ID}}')
}

function remove_container() {
  local container_id=$1
  docker rm -f "$container_id"
}

function main() {
  get_container_id
  # Remove all containers.
  if [ -n "$docker_container_ids" ]; then
    for container_id in $docker_container_ids; do
      echo "$container_id"
      # remove_container "$container_id"
    done
  else
    echo "No containers found!"
  fi
}

main
