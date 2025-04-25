#!/usr/bin/env bash
set -e

FLAG_FILE="/data/db/.initialized"

if [ ! -f "$FLAG_FILE" ]; then
    echo "Initializing MongoDB as a single node cluster"

    mkdir -p /data/db /data/configdb
    chown -R mongodb:mongodb /data/db /data/configdb
    mongod --logpath /var/log/mongodb/initdb.log --replSet "rs0" --bind_ip 0.0.0.0 --fork
    mongosh --eval 'rs.initiate({_id: "rs0", members: [{ _id: 0, host: "localhost:27017"}]})'
    mongod --shutdown
    touch "$FLAG_FILE"
fi

mongod --replSet "rs0" --bind_ip 0.0.0.0

wait -n
