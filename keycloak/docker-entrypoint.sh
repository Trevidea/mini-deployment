#!/bin/bash
# docker-entrypoint.sh - Custom entrypoint for Keycloak

# Add any initialization steps here if needed (e.g., custom configurations)

# Run the original Keycloak entrypoint
exec /opt/keycloak/bin/kc start-dev
