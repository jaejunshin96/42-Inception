FROM debian:bookworm-slim

RUN apt-get update
RUN apt-get install -y nginx \
                openssl

RUN mkdir /etc/nginx/ssl
RUN openssl req -newkey rsa:4096 -x509 -sha256 -days 365 -nodes \
       -out /etc/nginx/ssl/jaeshin.crt \
       -keyout /etc/nginx/ssl/jaeshin.key \
       -subj "/C=AU/ST=SA/L=Adelaide/O=42 School/OU=jaeshin/CN=jaeshin/"
RUN mkdir -p /run/nginx

COPY ./tools/nginx.conf /etc/nginx/conf.d
COPY ./tools/ /usr/share/nginx/html/

EXPOSE 443

CMD ["nginx", "-g", "daemon off;"]
