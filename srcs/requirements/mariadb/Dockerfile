FROM debian:bookworm

RUN apt-get update && apt-get install -y \
    mariadb-server \
    && rm -f /var/lib/apt/list/*

EXPOSE 3306