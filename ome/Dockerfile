FROM airensoft/ovenmediaengine:latest

# Install dependencies if needed
RUN apt-get update && apt-get install -y bash

# Copy your seed data into the image.
# Ensure that in your build context you have an 'ovenmediaengine' directory
# with subdirectories: origin_conf, ome_media, logs, certificates.
COPY ../ovenmediaengine /seed/ovenmediaengine

# Copy and set up the entrypoint script
COPY docker-entrypoint.sh /usr/local/bin/docker-entrypoint.sh
RUN chmod +x /usr/local/bin/docker-entrypoint.sh

# (Optional) Remove any VOLUME declarations here if you plan to mount the entire
# /opt/ovenmediaengine via docker-compose, so that the seeded data in the image isn’t hidden.

# Set the entrypoint
ENTRYPOINT ["/usr/local/bin/docker-entrypoint.sh"]

# Start OvenMediaEngine
CMD ["/opt/ovenmediaengine/bin/OvenMediaEngine"]