# syntax=docker/dockerfile:1

####################################
# Base Development image
# Build runtime image
####################################
FROM mcr.microsoft.com/dotnet/aspnet:10.0
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

