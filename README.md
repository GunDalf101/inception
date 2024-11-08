# Inception

Inception is a Docker-based system administration project that sets up a web infrastructure using Docker containers for NGINX, WordPress, and MariaDB. Each service runs in an isolated container, linked through a Docker network with TLS-secured access and persistent storage.

## Table of Contents
- [Overview](#overview)
- [Project Structure](#project-structure)
- [Setup Guide](#setup-guide)
- [Configuration](#configuration)
- [Features](#features)
- [Bonus Features](#bonus-features)
- [Troubleshooting](#troubleshooting)

## Overview

The Inception project provides a hands-on introduction to system administration and containerization:
- **Objective**: Build and manage a multi-container infrastructure with Docker Compose.
- **Services**: NGINX for web serving and SSL, WordPress for content management, and MariaDB as a database, all configured from scratch without relying on prebuilt images.
- **Environment**: Containers run on either Alpine or Debian to maintain a lightweight and efficient setup.

## Setup Guide

### Prerequisites

- **Docker** and **Docker Compose** installed.
- **Virtual Machine** (VM): The project must be run inside a VM for testing and isolation.
- **Domain Name**: Configure your domain (`login.42.fr`, replace `login` with your username) to redirect to `localhost`.

### Installation

1. **Clone the repository**:
   ```bash
   git clone https://github.com/GunDalf101/inception.git
   cd inception

2. **Set Up Environment Variables**:
- Create a ```.env``` file inside ```srcs``` for sensitive configuration (e.g., database passwords). This file is git-ignored for security.

3. **Build and Deploy**:
- Run the Makefile to build Docker images and start the infrastructure.
  ```make```

4. **Access the Application**:
- Visit ```https://mbennani.42.fr``` in your browser to view the WordPress site.

### Tear Down
- To stop and remove all containers:
  ```make fclean```

## Configuration
All configurations are managed within Dockerfiles and environment variables:

- **Environment Variables**: Stored in ```.env```, including database credentials and domain name.
- **SSL/TLS**: Configured for NGINX using TLSv1.2 or TLSv1.3 on port 443 for secure access.
- **Volumes**:
  - Persistent storage for WordPress content and database files.

## Features
### Core Services
- **NGINX**:
  - Serves as the single entry point for all requests.
  - Enforces HTTPS-only access with SSL/TLS (port 443).
- **WordPress**:
  - Deployed with PHP-FPM, allowing for a lightweight yet dynamic website.
  - Connected to MariaDB for content storage and management.
- **MariaDB**:
  - Secured database service exclusive to WordPress.
  - Two predefined users: one for administration and another for general access.

### Security
- **Environment Variable Management**: Sensitive information is stored in .env and is not exposed in Dockerfiles.
- **TLS Security**: Ensures encrypted communication via NGINX with SSL/TLS protocols.

## Bonus Features
Additional services can be added as separate containers, each with a dedicated Dockerfile and network configuration:

- **Redis**: Adds caching support for WordPress.
- **FTP Server**: Allows remote file management for WordPress content.
- **Adminer**: Web-based database management interface for MariaDB.
- **Static Website**: Deploy a static site (not in PHP) as an additional service.
- **Gopher Server**: A unique additional service to provide lightweight document retrieval, following the Gopher protocol.

## Troubleshooting
- **Issue**: Containers are not starting as expected.
  - **Solution**: Check the Docker Compose logs using docker-compose logs to identify issues with any service.
- **Issue**: SSL certificate errors when accessing NGINX.
  - **Solution**: Verify that SSL certificates are correctly configured and referenced in the NGINX Dockerfile.
