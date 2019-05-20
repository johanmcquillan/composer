#!/usr/bin/env bash

set -e
shopt -s nullglob

archive_dir=$(dirname $0)
compose_file="${archive_dir}/docker-compose.yaml"

eval $(docker-machine env)

docker-compose -f "${compose_file}" up -d --force-recreate --remove-orphans
