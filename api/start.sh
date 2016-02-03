#!/usr/bin/env bash

source ~/.bashrc

# Wait for the db service to be ready before continuing
echo "waiting for db..."
while ! nc -w 1 -z $DB_HOST $DB_PORT 2>/dev/null;
do
  echo .
  sleep 1
done

echo "db ready"

python manage.py migrate

python manage.py loaddata films

python manage.py runserver 0.0.0.0:8000