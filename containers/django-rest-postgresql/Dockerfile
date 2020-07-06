# vim:set ft=dockerfile:
FROM alpine:3.12

MAINTAINER Iván Chavero <ichaver@chavero.com.mx>

ENV LANG en_US.utf8
ENV PGDATA /var/lib/postgresql/data

RUN mkdir /docker-entrypoint-initdb.d && \
    set -eux && \
	apk add --no-cache postgresql postgresql-client bash su-exec tzdata sudo && \
    rm -rf /var/cache/apk

VOLUME /var/lib/postgresql/data

COPY setup_django_db.sh /usr/local/bin/
COPY docker-entrypoint.sh /usr/local/bin/
ENTRYPOINT ["docker-entrypoint.sh"]

EXPOSE 5432
CMD ["postgres"]
