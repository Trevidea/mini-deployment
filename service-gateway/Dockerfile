# --- Builder Stage ---
FROM ubuntu:latest AS builder
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


# Copy only the CMake-deps project and stamp Makefiles
COPY dependencies_cmake/ dependencies_cmake/
COPY dependencies_duckdb/ dependencies_duckdb/
COPY Makefile.cppzmq Makefile.spdlog Makefile.fmt Makefile.duckdb Makefile.jsoncpp \
    Makefile.cpr Makefile.httplib Makefile.libzmq Makefile.pqxx Makefile.gtest ./

# Build third-party dependencies (cached unless stamp files change)
RUN mkdir build-deps && cd build-deps \
    && cmake ../dependencies_cmake -DCMAKE_BUILD_TYPE=Release \
    && cmake --build . --target third_party_deps -j$(nproc)

# --- Builder Stage: build the application ---
# Copy the rest of the application source
COPY . .

# Configure and build only the capture-server target
RUN mkdir build && cd build \
    && cmake .. -DCMAKE_BUILD_TYPE=Release \
    && cmake --build . --target capture-server -j$(nproc)

# --- Runtime Stage ---
FROM ubuntu:latest AS runtime
ENV DEBIAN_FRONTEND=noninteractive

# Install minimal runtime libraries
RUN apt-get update && apt-get install -y --no-install-recommends \
    libstdc++6 \
    libpq5 \
    libzmq5 \
    && rm -rf /var/lib/apt/lists/*

WORKDIR /app

# Copy the built binary
COPY --from=builder /app/build/api/capture-server /usr/local/bin/capture-server

# Copy all third-party shared libraries
COPY --from=builder /app/third_party_install /usr/local/third_party_install

# Set library path for runtime dependencies
ENV LD_LIBRARY_PATH="/usr/local/third_party_install/spdlog/lib:/usr/local/third_party_install/fmt/lib:/usr/local/third_party_install/duckdb:/usr/local/third_party_install/jsoncpp/lib:/usr/local/third_party_install/cpr/lib:/usr/local/third_party_install/libzmq/lib:/usr/local/third_party_install/pqxx/lib:${LD_LIBRARY_PATH}"

# Expose service port
EXPOSE 1437

# Default entrypoint
CMD ["/usr/local/bin/capture-server"]