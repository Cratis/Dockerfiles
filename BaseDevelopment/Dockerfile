# syntax=docker/dockerfile:1

####################################
# Base Development image
# Build runtime image
####################################
FROM mcr.microsoft.com/dotnet/aspnet:7.0.8-bullseye-slim
ARG VERSION

RUN echo Version = ${VERSION}

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

