# syntax=docker/dockerfile:1
# Copyright (c) Cratis. All rights reserved.
# Licensed under the MIT license. See LICENSE file in the project root for full license information.

ARG BASE_IMAGE=cratis/base:dotnet11
FROM ${BASE_IMAGE}
ARG VERSION
ARG MONGO_VERSION=8.0.8

RUN echo Version = ${VERSION}

# MongoDB does not yet publish server packages for resolute. The noble packages
# use OpenSSL 3, available on resolute, without the focal libssl1.1 workaround.
RUN curl -fsSL https://www.mongodb.org/static/pgp/server-8.0.asc -o /tmp/mongodb-server-8.0.asc \
    && gpg --dearmor -o /usr/share/keyrings/mongodb-server-8.0.gpg /tmp/mongodb-server-8.0.asc \
    && rm /tmp/mongodb-server-8.0.asc \
    && echo "deb [ arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/mongodb-server-8.0.gpg ] https://repo.mongodb.org/apt/ubuntu noble/mongodb-org/8.0 multiverse" > /etc/apt/sources.list.d/mongodb-org-8.0.list \
    && apt-get update \
    && apt-get install -y --no-install-recommends \
        mongodb-org=${MONGO_VERSION} \
        mongodb-org-server=${MONGO_VERSION} \
        mongodb-org-shell=${MONGO_VERSION} \
        mongodb-org-mongos=${MONGO_VERSION} \
        mongodb-org-tools=${MONGO_VERSION} \
        mongodb-org-database=${MONGO_VERSION} \
        mongodb-org-database-tools-extra=${MONGO_VERSION} \
        tini \
    && rm -rf /var/lib/apt/lists/*

# Setup MongoDB as single-node replicaset
RUN mkdir -p /data/db /data/configdb \
    && chown -R mongodb:mongodb /data/db /data/configdb \
    && mongod --logpath /var/log/mongodb/initdb.log --replSet "rs0" --bind_ip 0.0.0.0 --fork \
    && mongosh --eval 'rs.initiate({_id: "rs0", members: [{ _id: 0, host: "localhost:27017"}]})' \
    && mongod --shutdown

VOLUME /data/db /data/configdb
