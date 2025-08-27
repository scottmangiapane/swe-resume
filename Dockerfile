FROM debian:bookworm-slim

COPY ./watch.sh /watch.sh

# Install only necessary LaTeX packages plus utilities for hashing
RUN apt-get update && \
    apt-get install -y --no-install-recommends \
    texlive-latex-base \
    texlive-latex-extra \
    texlive-fonts-extra \
    coreutils \
    findutils \
    && rm -rf /var/lib/apt/lists/* /var/cache/apt/*

WORKDIR /data
