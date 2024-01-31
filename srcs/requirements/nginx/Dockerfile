FROM debian:buster

RUN apt-get -y update && apt-get -y upgrade
RUN apt-get install -y 	nginx \
                        openssl \
                        procps \
                        vim

RUN mkdir -p /var/www/html/wordpress

RUN chmod 755 -R /var/www/html/
RUN chown -R www-data:www-data /var/www/html/

COPY ./conf/default.conf /etc/nginx/conf.d

COPY ./tools/nginx.sh /usr/local/bin/
RUN chmod +x /usr/local/bin/nginx.sh
CMD ["/usr/local/bin/nginx.sh"]