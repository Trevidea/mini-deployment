# --- Builder Stage ---
FROM ubuntu:latest AS builder

# Disable interactive dialogue
ENV DEBIAN_FRONTEND=noninteractive

# Install necessary build tools and dependencies
RUN apt-get update && apt-get install -y \
    build-essential \
    cmake \
    git \
    pkg-config \
    autoconf \
    automake \
    libtool \ 
    libzmq3-dev \
    libpq-dev \
    libssl-dev \
    curl \
    unzip
# Set working directory
WORKDIR /app

# Copy the entire service-gateway project into the container
COPY . .

# CMD ["/bin/sh"]
# Build the project (this will run your CMake configuration, which builds the external dependencies using your stamp mechanism)
RUN rm -rf build && mkdir build && cd build &&  cmake .. -DCMAKE_BUILD_TYPE=Release &&  cmake --build . -j$(nproc)

# --- Runtime Stage ---
FROM ubuntu:latest AS runtime

# Install minimal runtime libraries (e.g., standard C++ runtime)
RUN apt-get update && apt-get install -y --no-install-recommends \
    libstdc++6 \
    libpq5 \
    libzmq5 \
    && rm -rf /var/lib/apt/lists/*

WORKDIR /app

# Copy the built service-gateway binary from the builder stage
COPY --from=builder /app/build/api/capture-server /usr/local/bin/capture-server

# Copy the external dependencies (shared libraries) from third_party_install
COPY --from=builder /app/third_party_install /usr/local/third_party_install

# Update the runtime library search path so that your binary finds the required shared libraries.
# Adjust the paths below to include the lib directories for the dependencies that produce shared libraries.
ENV LD_LIBRARY_PATH="/usr/local/third_party_install/libzmq/lib:/usr/local/third_party_install/duckdb:/usr/local/third_party_install/spdlog/lib:/usr/local/third_party_install/fmt/lib:/usr/local/third_party_install/jsoncpp/lib:/usr/local/third_party_install/cpr/lib:${LD_LIBRARY_PATH}"

# Expose the port your service uses (adjust if necessary)
EXPOSE 1437

# Set the default command to run your service
CMD ["/usr/local/bin/capture-server"]