# Dockerfiles

This repository holds docker files and build workflows that are cross cutting the Cratis organization.

## Images

| Image | Version |
| ----- | ------- |
| MongoDB Developer Image | [![Docker Image Version](https://img.shields.io/docker/v/cratis/mongodb?label=MongoDB&logo=docker&sort=semver)](https://hub.docker.com/r/cratis/mongodb) |

### MongoDB

The MongoDB image is meant to be a development image that gives you a single node replica set.
This is typically needed to be able to utilize the change streams.
In production you typically have this enabled since you're most likely running with a replicate set.
