# Dockerfiles

This repository holds docker files and build workflows that are cross cutting the Cratis organization.
The images are built for `linux/amd64` and `linux/arm64` and published to [Docker Hub](https://hub.docker.com/u/cratis) under the `cratis` organization. Everything here is MIT licensed and free to use.

## Images

| Image | Version |
| ----- | ------- |
| MongoDB Developer Image | [![Docker Image Version](https://img.shields.io/docker/v/cratis/mongodb?label=MongoDB&logo=docker&sort=semver)](https://hub.docker.com/r/cratis/mongodb) |
| Base Development Image | [![Docker Image Version](https://img.shields.io/docker/v/cratis/base?label=Base&logo=docker&sort=semver)](https://hub.docker.com/r/cratis/base) |
| Base Development Image w/ MongoDB | [![Docker Image Version](https://img.shields.io/docker/v/cratis/base-mongodb?label=Base-MongoDB&logo=docker&sort=semver)](https://hub.docker.com/r/cratis/base-mongodb) |
| Base Development Image (.NET 11, Ubuntu 26.04) | `cratis/base:dotnet11`, `cratis/base:<version>-dotnet11` |
| Base Development Image w/ MongoDB (.NET 11, Ubuntu 26.04) | `cratis/base-mongodb:dotnet11`, `cratis/base-mongodb:<version>-dotnet11` |

### MongoDB

The MongoDB image is meant to be a development image that gives you a single node replica set.
This is typically needed to be able to utilize the change streams.
In production you typically have this enabled since you're most likely running with a replicate set.

### Base Development Image

The base development image is based on the ASP.NET Core runtime image and adds a few other nice to
have tools on top.

### Base Development Image w/ MongoDB

The base development image w/ MongoDB is based on the base development image and adds MongoDB.

### .NET 11 variants

The opt-in `dotnet11` tags use the ASP.NET Core 11 runtime on Ubuntu 26.04 (resolute).
The existing unsuffixed version tags and `latest` remain on the .NET 10 build path.
Use `<version>-dotnet11` to select a specific release of either image.

The MongoDB variant includes MongoDB 8.0.8, a single-node replica set, and `/usr/bin/tini`.
It uses MongoDB's Ubuntu 24.04 (noble) packages with OpenSSL 3; MongoDB does not yet
publish server packages for resolute. No legacy libssl1.1 package is installed.

The **Base Development Images for .NET 11** workflow publishes both images for
`linux/amd64` and `linux/arm64`, building MongoDB on the matching versioned base.
The separate `BaseDevelopmentDotNet11/` Dockerfiles do not change the existing builds.

## The Cratis ecosystem

This project is part of [Cratis](https://www.cratis.io) — free, MIT-licensed tools for building event-sourced and CQRS applications.

- **[Chronicle](https://github.com/Cratis/Chronicle)** — event-sourcing database and runtime. Orleans-based kernel, pluggable storage (MongoDB default; PostgreSQL, SQL Server, SQLite, in-memory), language-agnostic gRPC contracts. [Docs](https://www.cratis.io/chronicle/)
- **Chronicle clients** — first-class [.NET SDK](https://github.com/Cratis/Chronicle), plus [TypeScript](https://github.com/Cratis/Chronicle.TypeScript), [Kotlin/Java](https://github.com/Cratis/Chronicle.Kotlin), and [Elixir](https://github.com/Cratis/Chronicle.Elixir); [Python](https://github.com/Cratis/Chronicle.Python) coming soon (pre-alpha). AI agents connect through the [Chronicle MCP server](https://github.com/Cratis/Chronicle.Mcp).
- **[Arc](https://github.com/Cratis/Arc)** — opinionated CQRS framework for ASP.NET Core with commands, queries, validation, authorization, and TypeScript proxy generation. Works without event sourcing. [Docs](https://www.cratis.io/arc/)
- **[Components](https://github.com/Cratis/Components)** — React components aligned with Arc patterns. [Docs](https://www.cratis.io/components/)
- **[CLI](https://github.com/Cratis/cli) + Workbench** — inspect and diagnose Chronicle from the terminal or the browser. [Docs](https://www.cratis.io/cli/)
- **Model-first layer (experimental)** — [Studio](https://github.com/Cratis/Studio), [Screenplay](https://github.com/Cratis/Screenplay), [Stage](https://github.com/Cratis/Stage), [Scene](https://github.com/Cratis/Scene), [Prologue](https://github.com/Cratis/Prologue)
- **Supporting** — [Fundamentals](https://github.com/Cratis/Fundamentals), [Specifications](https://github.com/Cratis/Specifications), [Synopsis](https://github.com/Cratis/Synopsis), [Lens](https://github.com/Cratis/Lens), [Narrator](https://github.com/Cratis/Narrator), and free [AI tooling](https://github.com/Cratis/AI) (preview); [Ensemble](https://github.com/Cratis/Ensemble) coming soon (pre-release)
- **[Samples](https://github.com/Cratis/Samples)** — runnable event sourcing and CQRS samples for the whole stack

Everything Cratis publishes today is MIT licensed and free to use.
