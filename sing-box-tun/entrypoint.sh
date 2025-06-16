#!/bin/sh

set -e

if [ ! -f /etc/config/sing-box/config.json ]; then
    mkdir -p /etc/config/sing-box
    cp -r /config/sing-box/config.json /etc/config/sing-box/config.json
    sed -i "s|\${UUID}|${UUID}|g" /etc/config/sing-box/config.json
fi
if [ ! -d /etc/config/sing-box/rule-sets ]; then
    mkdir -p /etc/config/sing-box/rule-sets
    cp -r /config/sing-box/rule-sets/* /etc/config/sing-box/rule-sets/
fi

sed -i "s|\${UUID}|${UUID}|g" /etc/config/sing-box/config.json

echo "[INFO] Checking sing-box config..."
sing-box check -c /etc/config/sing-box/config.json || exit 1

echo "[INFO] Starting sing-box..."
exec sing-box run -c /etc/config/sing-box/config.json