#!/bin/bash
set -e

# You can put pre-start configuration here if you want

# Finally start Keycloak
exec /opt/keycloak/bin/kc.sh "$@"
