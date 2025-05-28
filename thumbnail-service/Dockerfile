FROM python:3.10-slim

# install ffmpeg
RUN apt-get update && \
    apt-get install -y ffmpeg && \
    rm -rf /var/lib/apt/lists/*

WORKDIR /app
COPY app.py .

# install Flask
RUN pip install --no-cache-dir flask

ENV FLASK_APP=app.py \
    FLASK_RUN_HOST=0.0.0.0

# mount this for thumbnails
VOLUME /data

EXPOSE 5000
CMD ["flask", "run"]