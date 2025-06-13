#!/bin/sh

set -e

mkdir -p /etc/config/
cp -r /config/* /etc/config/

sed -i "s|\${UUID}|${UUID}|g" /etc/config/sing-box/config.json
sed -i "s|\${PORT}|${PORT}|g" /etc/config/traefik/traefik.yml

if [ -S /var/run/docker.sock ]; then
  echo "Docker socket found. Enabling Docker provider in Traefik config..."
  sed -i 's/^# *docker: {}/docker: {}/' /etc/config/traefik/traefik.yml
fi

echo "[INFO] Checking sing-box config..."
sing-box check -c /etc/config/sing-box/config.json || exit 1

sing-box run -c /etc/config/sing-box/config.json &
whoami --port=8000 &

echo "[INFO] sing-box and whoami started, launching traefik..."
exec traefik --configFile=/etc/config/traefik/traefik.yml
