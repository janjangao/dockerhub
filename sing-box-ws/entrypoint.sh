#!/bin/sh

set -e

sed -i "s|\${PASSWORD}|${PASSWORD}|g" /etc/config/sing-box/config.json
sed -i "s|\${PORT}|${PORT}|g" /etc/config/traefik/traefik.yml

echo "[INFO] Checking sing-box config..."
sing-box check -c /etc/config/sing-box/config.json || exit 1

sing-box run -c /etc/config/sing-box/config.json &
whoami --port=8080 &

echo "[INFO] sing-box and whoami started, launching traefik..."
exec traefik --configFile=/etc/config/traefik/traefik.yml
