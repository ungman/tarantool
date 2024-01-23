#!/usr/bin/env bash
set -e
cd /app
echo "Building application"
cartridge build
echo "Start cartridge cluster in background"
cartridge start --run-dir=/tmp/run --data-dir=/tmp/data -d
sleep 10
echo "Setup topology"
cartridge replicasets setup --bootstrap-vshard --run-dir /tmp/run
sleep 10
echo "Run migrations"
curl -X POST http://localhost:8081/migrations/up
echo "require('data')" | tarantoolctl connect admin:secret-cluster-cookie@0.0.0.0:3301
#echo "Loading data"
#tarantool /entrypoint/load_data.lua

echo "Restarting cluster"
cartridge stop --run-dir=/tmp/run
sleep 10
cartridge start --run-dir=/tmp/run --data-dir=/tmp/data
