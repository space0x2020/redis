#!/bin/sh

/usr/local/bin/redis-server

exec "$@"
