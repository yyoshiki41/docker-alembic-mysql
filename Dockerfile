FROM python:3.7.2-alpine3.9

LABEL maintainer="yyoshiki41@gmail.com"

ENV ALEMBIC_VERSION='1.0.8'
ENV DOCKERIZE_VERSION=v0.6.1

RUN apk add --no-cache --update \
    wget g++ python3-dev mysql-client mariadb-connector-c-dev

# install dockerize
RUN wget -O /tmp/dockerize.tar.gz https://github.com/jwilder/dockerize/releases/download/$DOCKERIZE_VERSION/dockerize-alpine-linux-amd64-${DOCKERIZE_VERSION}.tar.gz && \
    tar -C /usr/local/bin -xzvf /tmp/dockerize.tar.gz && \
    rm -rf /var/cache/apk/* /tmp/*

# install alembic
RUN pip install --no-cache-dir \
    alembic==$ALEMBIC_VERSION \
    mysqlclient

WORKDIR /
COPY alembic.ini.tmpl /alembic.ini.tmpl

ENTRYPOINT ["dockerize", "-template", "/alembic.ini.tmpl:/alembic.ini", "alembic"]
CMD ["--help"]
