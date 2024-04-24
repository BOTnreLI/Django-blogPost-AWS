# syntax=docker/dockerfile:1.4

FROM --platform=$BUILDPLATFORM python:3.9.6 AS builder
EXPOSE 8000
WORKDIR /app
# install system dependencies
RUN apk update
RUN apk add \
    pkgconfig \
    gcc \
    musl-dev \
    bash \
    mariadb-dev

#install required packages that is listed in req.txt
COPY req.txt /app
RUN pip install --no-cache-dir -r req.txt

COPY . /app/
ENTRYPOINT [ "python3"]
CMD [ "manage.py", "runserver", "0.0.0.0:8000" ]