# Use the latest Debian image as the base
FROM debian:latest

# Set environment variables to avoid user interaction during installation
ENV DEBIAN_FRONTEND=noninteractive

# Update package list and install PyGopherd
RUN apt-get update && \
    apt-get install -y pygopherd

# Cleanup to reduce image size
RUN apt-get clean && \
    rm -rf /var/lib/apt/lists/*

# Create the directory for the PID file
RUN mkdir -p /var/run/pygopherd

# Ensure the PyGopherd user (or whichever user the server runs as) has access to this directory
# This might not be necessary if PyGopherd runs as root, but is a good practice for other services or if you're switching to a non-root user
# RUN chown pygopherd:pygopherd /var/run/pygopherd

# Optional: Copy your Gopher content and custom configuration into the image
# Create a directory for Gopher content
RUN mkdir -p /var/gopher
COPY gophermap /var/gopher/
COPY index.html /var/gopher/
COPY pygopherd.conf /etc/pygopherd/pygopherd.conf

# Expose the custom Gopher port
EXPOSE 9292

# Set the default command to run PyGopherd
CMD ["pygopherd"]
