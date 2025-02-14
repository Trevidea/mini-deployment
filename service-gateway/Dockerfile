# Use Ubuntu as the base image
FROM ubuntu:latest

# Install required packages
RUN apt-get update && apt-get install -y \
    build-essential \
    cmake \
    ninja-build \
    libpq-dev \
    libssl-dev \
    libreadline-dev \
    zlib1g-dev \
    git \
    libzmq3-dev \
    libcurl4-openssl-dev \
    libboost-all-dev \
    bash \
    curl \
    && rm -rf /var/lib/apt/lists/*  # Clean up to reduce image size

# Set environment variables
ENV DEBIAN_FRONTEND=noninteractive
ENV CMAKE_PREFIX_PATH=/app/dependency

# Set working directory
WORKDIR /app

# Copy the project files into the container
COPY . /app

# Copy dependencies (if any specific ones are needed)
COPY dependency /app/dependency

# Create logs directory
RUN mkdir -p /app/logs

# Clean up previous builds
RUN rm -rf /app/build /app/CMakeCache.txt

# Install dependencies, build the project, and clean up build tools
# RUN cmake -S . -B build -DCMAKE_CXX_FLAGS="-Wno-error -Wno-format-truncation" && cmake --build -j $(nproc) build --config Release

# Create the build directory before running cmake
RUN mkdir -p /app/build && cd /app/build && cmake -G Ninja .. && cmake --build . -j 4

# Ensure the binary has execution permission
RUN chmod +x /app/build/api/capture-server

# Expose the required port
EXPOSE 1437
# Set the default command to run the application and store logs
CMD ["/bin/bash", "-c", "/app/build/api/capture-server | tee /app/logs/service-gateway.log"]













# # Use Ubuntu as the base image
# FROM ubuntu:latest
# # Install required packages
# RUN apt-get update && apt-get install -y \
#     build-essential \
#     cmake \
#     ninja-build \
#     libpq-dev \
#     libssl-dev \
#     libreadline-dev \
#     zlib1g-dev \
#     git \
#     libzmq3-dev \
#     libcurl4-openssl-dev \
#     libboost-all-dev \
#     libcpprest-dev \
#     bash \
#     curl \
#     && rm -rf /var/lib/apt/lists/*  # Clean up to reduce image size
# # Set environment variables
# ENV DEBIAN_FRONTEND=noninteractive
# ENV CMAKE_PREFIX_PATH=/app/dependency
# # Set working directory
# WORKDIR /app
# # Copy the project files into the container
# COPY . /app
# # Copy dependencies (if any specific ones are needed)
# COPY dependency /app/dependency
# # Clean up previous builds
# RUN rm -rf /app/build /app/CMakeCache.txt
# # Install dependencies, build the project, and clean up build tools
# RUN cmake -S . -B build -DCMAKE_CXX_FLAGS="-Wno-error -Wno-format-truncation" && cmake --build build --config Release
# # Ensure the binary has execution permission
# RUN chmod +x /app/build/api/capture-server
# # Expose the required port
# EXPOSE 1437
# # Set the default command to run the application
# CMD ["/app/build/api/capture-server"]
