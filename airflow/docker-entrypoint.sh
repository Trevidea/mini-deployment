#!/bin/bash
set -e

echo ">>> Custom Entrypoint: Starting Airflow with PID $$"

# Optional: Print initial memory usage of the container
echo ">>> Memory usage at startup:"
free -h || echo "free command not available"

# Optional: Print cgroup memory limits
echo ">>> cgroup memory limits:"
cat /sys/fs/cgroup/memory/memory.limit_in_bytes 2>/dev/null || echo "cgroup memory info not available"

# Run DB init only once — use a marker file or check connection
if [ ! -f "/opt/airflow/initialized" ]; then
  echo ">>> First-time setup: Initializing Airflow DB"
  airflow db init

  # Optional: Auto-create admin user
  if [[ "$_AIRFLOW_WWW_USER_CREATE" == "true" ]]; then
    echo ">>> Creating default Airflow admin user"
    airflow users create \
      --username "${_AIRFLOW_WWW_USER_USERNAME:-admin}" \
      --password "${_AIRFLOW_WWW_USER_PASSWORD:-admin}" \
      --firstname "${_AIRFLOW_WWW_USER_FIRSTNAME:-Airflow}" \
      --lastname "${_AIRFLOW_WWW_USER_LASTNAME:-Admin}" \
      --role "${_AIRFLOW_WWW_USER_ROLE:-Admin}" \
      --email "${_AIRFLOW_WWW_USER_EMAIL:-airflowadmin@example.com}" || true
  fi

  # Create marker file
  touch /opt/airflow/initialized
else
  echo ">>> Airflow DB already initialized, skipping"
fi

# Optional: DB migration if env is set
if [[ "$_AIRFLOW_DB_MIGRATE" == "true" ]]; then
  echo ">>> Running airflow db migrate"
  airflow db migrate
fi

echo ">>> Starting Airflow component: $@"
exec /entrypoint "$@"
