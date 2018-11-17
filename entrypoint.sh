#!/bin/sh

set -e

NAMED_UID=$(id -u named)
NAMED_GID=$(id -g named)

if [ $NAMED_UID -ne 1100 ] || [$NAMED_GID -ne 1100 ]
then
    deluser named
    addgroup -g 1100 named
    adduser -u 1100 -G named -h /etc/bind -s /sbin/nologin -D named
    
    mkdir -p /var/log/named
    chown -R named:named /var/bind /etc/bind /var/run/named /var/log/named
    chmod -R 770 /var/bind /etc/bind /var/run/named /var/log/named
fi

exec /usr/sbin/named -u named -c /etc/bind/named.conf -f