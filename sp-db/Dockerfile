# Use the official PostgreSQL image as base
FROM postgres:15

# Set the environment variables for the database
ENV POSTGRES_USER=drake_8283
ENV POSTGRES_PASSWORD=sportpip
ENV POSTGRES_DB=half-stack

# Set custom data directory for PostgreSQL
ENV PGDATA=/var/lib/postgresql/data

# Copy the initialization SQL script and custom initialization script to the container
COPY ./postgres-backup/half-stack.sql /docker-entrypoint-initdb.d/half-stack.sql

# Set the custom initialization script as the entrypoint
ENTRYPOINT ["/docker-entrypoint-initdb.d/init-db.sh"]

# Expose PostgreSQL port
EXPOSE 5432

# Use the default CMD from the postgres base image
CMD ["postgres"]
