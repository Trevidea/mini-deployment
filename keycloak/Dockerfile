FROM quay.io/keycloak/keycloak:latest

# Enable health and metrics support
ENV KC_HEALTH_ENABLED=true
ENV KC_METRICS_ENABLED=true

WORKDIR /opt/keycloak

# Copy the custom entrypoint script into the container with the correct permissions
COPY --chmod=755 docker-entrypoint.sh /opt/keycloak/docker-entrypoint.sh

# Optional: Generate self-signed cert for HTTPS (can be skipped if not needed)
# RUN keytool -genkeypair -storepass password -storetype PKCS12 -keyalg RSA -keysize 2048 \
#     -dname "CN=server" -alias server -ext "SAN:c=DNS:localhost,IP:127.0.0.1" \
#     -keystore conf/server.keystore

# Use the correct start-up command for Keycloak (latest version may require `kc` as the main executable)
ENTRYPOINT ["/opt/keycloak/bin/kc.sh", "start-dev"]
