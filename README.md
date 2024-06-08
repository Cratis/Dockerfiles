# Dockerfiles

This repository holds docker files and build workflows that are cross cutting the Cratis organization.

## Images

| Image | Version |
| ----- | ------- |
| MongoDB Developer Image | [![Docker Image Version](https://img.shields.io/docker/v/cratis/mongodb?label=MongoDB&logo=docker&sort=semver)](https://hub.docker.com/r/cratis/mongodb) |
| Base Development Image | [![Docker Image Version](https://img.shields.io/docker/v/cratis/mongodb?label=MongoDB&logo=docker&sort=semver)](https://hub.docker.com/r/cratis/base) |
| Base Development Image w/ MongoDB | [![Docker Image Version](https://img.shields.io/docker/v/cratis/mongodb?label=MongoDB&logo=docker&sort=semver)](https://hub.docker.com/r/cratis/base-mongodb) |

### MongoDB

The MongoDB image is meant to be a development image that gives you a single node replica set.
This is typically needed to be able to utilize the change streams.
In production you typically have this enabled since you're most likely running with a replicate set.

### Base Development Image

The base development image is based on the ASP.NET Core runtime image and adds a few other nice to
have tools on top.

### Base Development Image w/ MongoDB

The base development image w/ MongoDB is based on the base development image and adds MongoDB.
