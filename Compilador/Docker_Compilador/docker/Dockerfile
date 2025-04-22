FROM ubuntu:22.04

ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update && apt-get install -y \
    build-essential \
    git \
    wget \
    curl \
    python3 \
    ca-certificates \
    libreadline-dev \
    libftdi-dev \
    pkg-config \
    unzip \
    libboost-all-dev \
    cmake \
    && rm -rf /var/lib/apt/lists/*

RUN mkdir -p /opt && \
    wget https://github.com/YosysHQ/oss-cad-suite-build/releases/download/2023-12-16/oss-cad-suite-linux-x64-20231216.tgz && \
    tar -xvzf oss-cad-suite-linux-x64-20231216.tgz -C /opt && \
    rm oss-cad-suite-linux-x64-20231216.tgz

ENV PATH="/opt/oss-cad-suite/bin:$PATH"

WORKDIR /workspace