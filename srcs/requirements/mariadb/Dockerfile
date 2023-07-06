FROM debian:buster

RUN apt-get update
RUN apt-get install -y mariadb-server \
    mariadb-client \
    vim \
    && rm -rf /var/lib/apt/lists/*

RUN mkdir -p /var/run/mysqld \
&& chown -R mysql:mysql /var/run/mysqld \
&& chmod 755 /var/run/mysqld

EXPOSE 3306

COPY ./tools/start.sh /usr/local/bin/
COPY conf/50-server.conf	/etc/mysql/mariadb.conf.d/50-server.conf


RUN chmod 755 /etc/mysql/mariadb.conf.d
RUN chmod +x /usr/local/bin/start.sh

ENTRYPOINT [ "/usr/local/bin/start.sh" ]

CMD ["mysqld", "--bind-address=0.0.0.0"]
