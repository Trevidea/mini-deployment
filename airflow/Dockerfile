# Use Airflow base image
FROM apache/airflow:2.9.0-python3.8

# Install essential OS packages
USER root
RUN apt-get update && apt-get install -y --no-install-recommends \
    procps \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

# Install minimal Python packages
USER airflow
RUN pip install --no-cache-dir psutil

# Copy custom entrypoint script
USER root
COPY docker-entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

# Set custom entrypoint
ENTRYPOINT ["/entrypoint.sh"]

# Set default command
CMD ["webserver"]
