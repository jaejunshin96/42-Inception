FROM debian:buster

RUN apt-get update && apt-get install -y \
    wget \
    unzip \
    php8.2 \
    php-fpm \
    php-mysql \
    php-curl \
    php-cli

COPY ./conf/www.conf /etc/php/8.2/fpm/pool.d/

RUN mkdir -p /run/php

COPY ./tools/wordpress.sh /usr/local/bin/
RUN chmod +x /usr/local/bin/wordpress.sh
ENTRYPOINT [ "/usr/local/bin/wordpress.sh" ]

WORKDIR /var/www/html/

EXPOSE 9000

CMD [ "/usr/sbin/php-fpm8.2", "-F" ]
