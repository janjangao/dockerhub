#!/bin/sh

set -e

if [ ! -f /etc/config/sing-box/config.json ]; then
    mkdir -p /etc/config/
    cp -r /config/* /etc/config/
    
    sed -i "s|\${UUID}|${UUID}|g" /etc/config/sing-box/config.json
fi

sed -i "s|\${UUID}|${UUID}|g" /etc/config/sing-box/config.json

echo "[INFO] Checking sing-box config..."
sing-box check -c /etc/config/sing-box/config.json || exit 1

exec sing-box run -c /etc/config/sing-box/config.json