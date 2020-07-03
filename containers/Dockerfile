FROM python:3-alpine
ENV PYTHONUNBUFFERED 1
RUN mkdir /code
WORKDIR /code
COPY requirements.txt /code/
RUN apk add --no-cache postgresql-libs && \
    apk add --no-cache --virtual .build-deps gcc musl-dev postgresql-dev libffi-dev libffi && \
    python3 -m pip install -r requirements.txt --no-cache-dir && \
    apk --purge del .build-deps
COPY . /code/
