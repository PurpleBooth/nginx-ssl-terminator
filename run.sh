#!/usr/bin/env bash

set -e

if [ -f ${SSL_KEY_PATH:-/..} ] ; then
    cp $SSL_KEY_PATH /certificate.key
fi

if [ -f ${SSL_CRT_PATH:-/..} ] ; then
    cp $SSL_CRT_PATH /certificate.crt
fi



if [ -z "$SERVER_NAME" ] ; then
    sed -i"" "s#XXXXXXX##g" /etc/nginx/nginx.conf
else
    sed -i"" "s#XXXXXXX#server_name $SERVER_NAME;#g" /etc/nginx/nginx.conf
fi

sed -i"" "s#~~~~~~~#$UPSTREAM#g" /etc/nginx/nginx.conf

exec nginx -g "daemon off; error_log /dev/stderr info;"
