FROM debian:bookworm

RUN apt -y update && apt -y upgrade
RUN apt install -y  wget \
                    vim \
                    php-fpm \
                    php-mysql \
					sendmail \
                    mariadb-client

RUN mkdir -p /home/jaejun/data/files/

COPY ./tools/wordpress.sh /usr/local/bin/
RUN chmod +x /usr/local/bin/wordpress.sh
ENTRYPOINT ["/usr/local/bin/wordpress.sh"]
CMD ["php-fpm8.2", "-F"]