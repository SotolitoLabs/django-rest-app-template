FROM python:3-alpine

MAINTAINER Iván Chavero <ichaver@chavero.com.mx>

ENV PYTHONUNBUFFERED 1
RUN mkdir /code
WORKDIR /code
COPY requirements.txt /code/
RUN apk add --no-cache postgresql-libs  \
    gcc musl-dev postgresql-dev libffi-dev libffi && \
    python3 -m pip install -r requirements.txt --no-cache-dir && \
    rm -rf /var/cache/apk

EXPOSE 8000

