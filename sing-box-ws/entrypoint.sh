#!/bin/sh
sed -i "s/PORT/$PORT/g" /etc/config/sing-box/config.json
sed -i "s/PASSWORD/$PASSWORD/g" /etc/config/sing-box/config.json
exec "$@"