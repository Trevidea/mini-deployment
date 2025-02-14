#!/bin/sh
set -e

CONFIG_DIR="/opt/ovenmediaengine/bin/conf"
MEDIA_DIR="/opt/ovenmediaengine/media"
LOGS_DIR="/var/log/ovenmediaengine"
CERTS_DIR="/opt/ovenmediaengine/certs"

# Ensure that the target directories exist
mkdir -p "$CONFIG_DIR" "$MEDIA_DIR" "$LOGS_DIR" "$CERTS_DIR"

# Seed configuration files if empty
if [ -z "$(ls -A ${CONFIG_DIR})" ]; then
  echo "OM Config is empty. Copying default files into ${CONFIG_DIR}..."
  cp -r /seed/ovenmediaengine/origin_conf/* "${CONFIG_DIR}/"
else
  echo "Config already exists in ${CONFIG_DIR}. Skipping seeding."
fi

# Seed media files if empty
if [ -z "$(ls -A ${MEDIA_DIR})" ]; then
  echo "OM Media is empty. Copying default files into ${MEDIA_DIR}..."
  cp -r /seed/ovenmediaengine/ome_media/* "${MEDIA_DIR}/"
else
  echo "Media already exists in ${MEDIA_DIR}. Skipping seeding."
fi

# Seed log files if empty
if [ -z "$(ls -A ${LOGS_DIR})" ]; then
  echo "OM Logs are empty. Copying default files into ${LOGS_DIR}..."
  cp -r /seed/ovenmediaengine/logs/* "${LOGS_DIR}/"
else
  echo "Logs already exist in ${LOGS_DIR}. Skipping seeding."
fi

# Seed certificate files if empty
if [ -z "$(ls -A ${CERTS_DIR})" ]; then
  echo "OM Certificates are empty. Copying default files into ${CERTS_DIR}..."
  cp -r /seed/ovenmediaengine/certificates "${CERTS_DIR}/"
else
  echo "Certificates already exist in ${CERTS_DIR}. Skipping seeding."
fi

exec "$@"