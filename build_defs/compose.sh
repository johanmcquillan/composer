#!/usr/bin/env bash

set -e
shopt -s nullglob

# archive_dir=$(dirname $0)
# compose_file="${archive_dir}/docker-compose.yaml"

compose_file=__COMPOSE_FILE__

eval $(docker-machine env)

# sed -i -e 's/${DOCKER_IP}/'"$(docker-machine ip)"/g "${compose_file}"

docker-compose -f "${compose_file}" up -d --force-recreate --remove-orphans
