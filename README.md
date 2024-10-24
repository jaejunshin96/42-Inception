# Inception - System Administration with Docker

## Project Overview

**Inception** is a system administration project that focuses on using Docker to virtualize and manage multiple services in isolated containers. The project involves setting up a small infrastructure with Docker Compose, ensuring that each service runs in its own container, and managing their interconnections through a Docker network. This project provided hands-on experience in Docker, containerization, and service orchestration, as well as an introduction to concepts like TLS encryption and secure service configuration.

The project requires creating custom Docker images for each service and configuring the entire system through a `docker-compose.yml` file and a `Makefile`.

---

## Key Features

- **Program Name**: `inception`
- **Core Features**:
  - **NGINX**: Configured to use TLSv1.2 or TLSv1.3 for secure communication.
  - **WordPress + php-fpm**: Deployed in a container to serve a WordPress site, without NGINX in this container.
  - **MariaDB**: A separate container running the MariaDB database, storing the WordPress data.
  - **Volumes**: Two volumes are used—one for WordPress files and another for the database.
  - **Docker Networking**: All containers are connected via a Docker network.
  - **Domain Name**: The domain `login.42.fr` (with your login name) is set up to point to the server's local IP address.

---

## Technical Details

- **Docker Compose**: The project uses `docker-compose.yml` to define all services and their configurations, ensuring that each service is isolated in its own container.
- **Dockerfiles**: Custom Dockerfiles are written for each service (NGINX, WordPress, and MariaDB) to build the required images.
- **Volumes**: Persistent volumes are used to store WordPress files and the MariaDB database.
- **TLS Security**: NGINX is configured to serve content over HTTPS using TLSv1.2 or TLSv1.3, ensuring secure communication between the client and the server.
- **Environment Variables**: Sensitive information, like database credentials, is stored in environment variables, which are managed securely using `.env` files and Docker secrets.

### Example:
- **WordPress Setup**: The WordPress container is configured with two users (one admin), and the database is stored in a MariaDB container. The admin username must not contain "admin" or "administrator."
- **NGINX**: Acts as the entry point for the infrastructure, running on port 443 and serving the WordPress site securely via HTTPS.

---

## Skills Demonstrated

- **Containerization**: Gained hands-on experience in deploying and managing services using Docker and Docker Compose.
- **Service Configuration**: Learned to configure services like NGINX, WordPress, and MariaDB in isolated containers, ensuring they function correctly in a networked environment.
- **Secure Communication**: Configured TLS certificates and ensured that communication between the NGINX server and the client is secure.
- **Environment Management**: Used `.env` files and Docker secrets to manage sensitive information securely.
- **Network Management**: Configured Docker networks to connect containers, ensuring isolated communication between services.

---

## Conclusion

The **Inception** project provided an in-depth introduction to Docker, containerization, and service orchestration. By setting up a multi-service infrastructure with Docker Compose, I gained valuable skills in system administration, network configuration, and secure service deployment. The project’s focus on building services from scratch, managing volumes, and ensuring secure communication highlighted the importance of understanding containerization technologies in modern system administration.
