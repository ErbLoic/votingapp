#!/bin/sh
# Si un secret Docker est fourni (DB_PASSWORD_FILE), on le lit dans DB_PASSWORD.
# Sinon, on garde la variable DB_PASSWORD (fichier .env avec Docker Compose).
set -e
if [ -n "$DB_PASSWORD_FILE" ] && [ -f "$DB_PASSWORD_FILE" ]; then
  DB_PASSWORD="$(cat "$DB_PASSWORD_FILE")"
  export DB_PASSWORD
fi
exec "$@"
