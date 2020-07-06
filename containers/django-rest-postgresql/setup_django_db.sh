#!/usr/bin/env bash

DJANGO_DB=$1
DJANGO_USER=$2
DJANGO_PASSWORD=$3

echo "Creating user: ${DJANGO_USER}"
createuser ${DJANGO_USER} 
echo "Setting password for user: ${DJANGO_USER}"
psql <<EOF
ALTER USER ${DJANGO_USER} WITH PASSWORD '${DJANGO_PASSWORD}';
EOF

echo "Creating database: ${DJANGO_DB}"
createdb ${DJANGO_DB} --encoding='utf-8' --locale=en_US.utf8 --template=template0 -O ${DJANGO_USER}



