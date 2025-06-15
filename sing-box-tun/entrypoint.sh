#!/bin/sh

set -e

mkdir -p /etc/config/
cp -r /config/* /etc/config/

echo "[INFO] Checking sing-box config..."
sing-box check -c /etc/config/sing-box/config.json || exit 1

sing-box run -c /etc/config/sing-box/config.json