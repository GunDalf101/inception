FROM debian:12

RUN apt-get update && \
    apt-get install -y pygopherd

RUN apt-get clean && \
    rm -rf /var/lib/apt/lists/*

RUN mkdir -p /var/run/pygopherd

RUN mkdir -p /var/gopher
COPY gophermap /tmp
COPY index.html /tmp
COPY script.sh /tmp
COPY pygopherd.conf /etc/pygopherd/pygopherd.conf

RUN chmod +x /tmp/script.sh

EXPOSE 9292

ENTRYPOINT [ "/tmp/script.sh" ]
