FROM python:3.7.2-alpine3.9

LABEL maintainer="yyoshiki41@gmail.com"

ENV ALEMBIC_VERSION='1.0.8'

RUN apk add --no-cache --update \
    gcc python3-dev libmysqlclient-dev
RUN pip install --no-cache-dir alembic==$ALEMBIC_VERSION

ENTRYPOINT ["alembic"]
CMD ["--help"]
