FROM ubuntu:24.04

RUN apt update && apt install -y \
    imagemagick \
    libimage-exiftool-perl \
    && apt clean \
    && rm -rf /var/lib/apt/lists/*

COPY src /src

RUN chmod +x /src/heic_to_jpeg.sh