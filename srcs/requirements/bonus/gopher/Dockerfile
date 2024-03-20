FROM debian:latest

ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update && \
    apt-get install -y pygopherd

RUN apt-get clean && \
    rm -rf /var/lib/apt/lists/*

RUN mkdir -p /var/run/pygopherd

RUN mkdir -p /var/gopher

COPY pygopherd.conf /etc/pygopherd/pygopherd.conf

CMD ["pygopherd"]
