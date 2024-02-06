FROM debian:buster

RUN apt-get -y update && apt-get -y upgrade
RUN apt-get install -y 	mariadb-server

COPY ./conf/50-server.cnf /etc/mysql/mariadb.conf.d/50-server.cnf

COPY ./tools/mariadb.sh /usr/local/bin/
RUN chmod +x /usr/local/bin/mariadb.sh
ENTRYPOINT ["/usr/local/bin/mariadb.sh"]

CMD ["mysqld_safe"]