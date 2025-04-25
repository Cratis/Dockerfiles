# syntax=docker/dockerfile:1
FROM ubuntu:focal

ARG VERSION=8.0.8
ARG MONGO_PACKAGE=mongodb-org

RUN echo Version = ${VERSION}

WORKDIR /app

# Install Tools
RUN apt-get update \
    && apt-get install -y --no-install-recommends \
    nano \
    iputils-ping \
    netcat \
    wget \
    curl \
    gnupg \
    apt-transport-https \
    ca-certificates \
    && rm -rf /var/lib/apt/lists/*

# Install MongoDB
RUN wget --no-check-certificate -qO - https://www.mongodb.org/static/pgp/server-8.0.asc | apt-key add - \
    && echo "deb [ arch=$(dpkg --print-architecture) ] https://repo.mongodb.org/apt/ubuntu focal/mongodb-org/8.0 multiverse" > /etc/apt/sources.list.d/mongodb-org-8.0.list \
    && apt-get update \
    && apt-get install -y --no-install-recommends \
        ${MONGO_PACKAGE}=$VERSION \
        ${MONGO_PACKAGE}-server=$VERSION \
        ${MONGO_PACKAGE}-shell=$VERSION \
        ${MONGO_PACKAGE}-mongos=$VERSION \
        ${MONGO_PACKAGE}-tools=$VERSION \
        ${MONGO_PACKAGE}-database=$VERSION \
        ${MONGO_PACKAGE}-database-tools-extra=$VERSION \    
    && rm -rf /var/lib/apt/lists/*

# # Setup MongoDB as single-node replicaset
RUN mkdir -p /data/db /data/configdb \
    && chown -R mongodb:mongodb /data/db /data/configdb \
    && mongod --logpath /var/log/mongodb/initdb.log --replSet "rs0" --bind_ip 0.0.0.0 --fork \
    && mongosh --eval 'rs.initiate({_id: "rs0", members: [{ _id: 0, host: "localhost:27017"}]})' \
    && mongod --shutdown

VOLUME /data/db /data/configdb

COPY ./MongoDB/entrypoint.sh /app/entrypoint.sh
RUN chmod +x /app/entrypoint.sh

ENTRYPOINT [ "/app/entrypoint.sh" ]
