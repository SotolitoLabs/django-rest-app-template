# Hacking 

## Environment
Development is done using a common docker image to avoid environment inconsistencies.
The Docker image is based on the latest stable CentOS and the django packages user are the ones included on the 
distro, exceptions are made when the python package is not included.

All code should include testing.

All code contributions should be pushed as a PR


### Running
```
docker run -ti -v `pwd`:/code --name test-django sotolito/django django-admin startproject /code
```


### Database setup

The application relies on a database that resides in a Podman container. The following steps describe the procedure to configure the database

Execute the script postgres_up.sh located in /src . This script will create the container from the latest postgres image

Once the container has been created, we have to login into it to finish configuring it

#### Shell setup

```
podman exec -it bmpostgres /bin/bash
~# su - postgres
~$ createuser -P beeruser
Enter password for new role: 
Enter it again: 
~$ createdb -O beermaster_db_user -E UTF8 -T template0 --locale=en_US.utf8 beermaster_db

```

#### Manual setup

```

podman exec -it bmpostgres /bin/bash

su - postgres

psql

CREATE DATABASE beermasters;

CREATE USER db_user WITH PASSWORD 'copacervecera';

ALTER ROLE db_user SET client_encoding TO 'utf8';
ALTER ROLE db_user SET default_transaction_isolation TO 'read committed';
ALTER ROLE db_user SET timezone TO 'UTC';


GRANT ALL PRIVILEGES ON DATABASE beermasters TO db_user;

\q

exit  // from postgres user

exit  // from container
```


## TODO
* Dockerfile
* CI




