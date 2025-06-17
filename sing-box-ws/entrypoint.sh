#!/bin/sh

set -e

if [ ! -f /etc/config/sing-box/config.json ]; then
    mkdir -p /etc/config/
    cp -r /config/* /etc/config/

    sed -i "s|\${UUID}|${UUID}|g" /etc/config/sing-box/config.json
    sed -i "s|\${PORT}|${PORT}|g" /etc/config/traefik/traefik.yml
fi

if [ "$HTTPS_REDIRECT" = "true" ] && [ -f "/etc/config/traefik/config/sing-box.yml" ]; then
  sed -i 's/middlewares: \[\${https-redirect}\]/middlewares: \["https-redirect"\]/' /etc/config/traefik/config/sing-box.yml
else
  sed -i '/middlewares: \[\${https-redirect}\]/d' /etc/config/traefik/config/sing-box.yml
fi

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
