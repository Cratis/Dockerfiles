# syntax=docker/dockerfile:1
# Copyright (c) Cratis. All rights reserved.
# Licensed under the MIT license. See LICENSE file in the project root for full license information.

FROM mcr.microsoft.com/dotnet/aspnet:11.0-resolute
ARG VERSION

RUN echo Version = ${VERSION}

# Install Tools
RUN apt-get update \
    && apt-get install -y --no-install-recommends \
    nano \
    iputils-ping \
    netcat-traditional \
    wget \
    curl \
    gnupg \
    apt-transport-https \
    ca-certificates \
    && rm -rf /var/lib/apt/lists/*
