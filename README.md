# docker-alembic-mysql
Docker image for alembic (support for the MySQL database)

[![Docker Build Status](https://img.shields.io/docker/build/yyoshiki41/alembic-mysql.svg)](https://hub.docker.com/r/yyoshiki41/alembic-mysql/tags/)
[![Docker Automated build](https://img.shields.io/docker/automated/yyoshiki41/alembic-mysql.svg)](https://hub.docker.com/r/yyoshiki41/alembic-mysql/builds/)

## Installation

```bash
$ docker pull yyoshiki41/alembic-mysql
```

## Usage

```bash
$ docker run \
    -v "$(pwd)"/alembic:/alembic \
    -e "ALEMBIC_URL=mysql://root:@host.docker.internal:3306/dbname" \
    --rm yyoshiki41/alembic-mysql current
```

### Environment Variables

#### `ALEMBIC_URL`

This variable is mandatory.

#### `ALEMBIC_SCRIPT`

This variable is optional and allows you to specify the directory of alembic scripts.

e.g.)
```bash
$ docker run \
    -v "$(pwd)"/db:/db \
    -e "ALEMBIC_URL=mysql://root:@host.docker.internal:3306/dbname" \
    -e "ALEMBIC_SCRIPT=db" \
    --rm yyoshiki41/alembic-mysql current
```
