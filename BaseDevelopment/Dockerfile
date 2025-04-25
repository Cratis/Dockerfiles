# syntax=docker/dockerfile:1

####################################
# Base Development image
# Build runtime image
####################################
FROM mcr.microsoft.com/dotnet/runtime:9.0.0-bookworm-slim
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

