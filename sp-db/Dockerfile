# Use the official PostgreSQL image as base
FROM postgres:15

# Set environment variables for database configuration
ENV POSTGRES_USER=drake_8283
ENV POSTGRES_PASSWORD=sportpip
ENV POSTGRES_DB=half-stack

# Declare a volume to persist the PostgreSQL data
VOLUME /var/lib/postgresql/data

# Copy your backup file into the initialization directory.
# Any .sql or .sh file in /docker-entrypoint-initdb.d/ will be executed
# when the container is initialized (i.e. when the data directory is empty).
COPY postgres-backup/demo.sql /docker-entrypoint-initdb.d/