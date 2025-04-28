FROM quay.io/keycloak/keycloak:latest

# Enable health and metrics
ENV KC_HEALTH_ENABLED=true
ENV KC_METRICS_ENABLED=true

WORKDIR /opt/keycloak

# Copy your custom entrypoint if you need it
COPY --chmod=755 docker-entrypoint.sh /opt/keycloak/docker-entrypoint.sh

# Set the entrypoint
ENTRYPOINT ["/opt/keycloak/docker-entrypoint.sh"]
