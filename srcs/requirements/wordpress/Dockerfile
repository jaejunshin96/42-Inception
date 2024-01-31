FROM debian:buster

RUN apt-get -y update && apt-get -y upgrade
RUN apt-get install -y  wget \
                        vim \
                        php-fpm \
                        php-mysql \
                        sendmail \
                        mariadb-client
                    
COPY ./conf/www.conf /etc/php/7.3/fpm/pool.d

RUN mkdir -p /run/php/

COPY ./tools/wordpress.sh /usr/local/bin/
RUN chmod +x /usr/local/bin/wordpress.sh
ENTRYPOINT ["/usr/local/bin/wordpress.sh"]

CMD ["/usr/sbin/php-fpm7.3", "-F"]