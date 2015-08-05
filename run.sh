#!/usr/bin/env bash

set -e

cp "$SSL_KEY_PATH" /certificate.key
cp "$SSL_CRT_PATH" /certificate.crt
sed -i"" "s#~~~~~~~#$UPSTREAM#g" /etc/nginx/nginx.conf
exec nginx -g "daemon off; error_log /dev/stderr info;"