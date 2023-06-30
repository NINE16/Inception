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

#COPY		./conf/mysqld.conf ~/my.cnf
#COPY		./conf/mysqld.conf /etc/mysql/my.cnf
#COPY		./conf/mysqld.conf /etc/my.cnf


#Copy of the .sh and .sql in the /bin of the container to be able to run the program
# Give the right to execute + launch the .sh
COPY ./tools/start.sh /usr/local/bin/
# COPY ./conf/wordpress.sql /usr/local/bin/
# COPY ./conf/50-server.conf /etc/mysql/my.conf
COPY conf/50-server.conf	/etc/mysql/mariadb.conf.d/50-server.conf


RUN chmod 755 /etc/mysql/mariadb.conf.d
RUN chmod +x /usr/local/bin/start.sh
# RUN chmod +x /usr/local/bin/wordpress.sql

ENTRYPOINT [ "/usr/local/bin/start.sh" ]

#Command to launch mariadb and enable the database to listen globally - also can be put on mysqldump.cnf file
CMD ["mysqld", "--bind-address=0.0.0.0"]

# FROM debian:buster

# RUN apt-get update && apt-get upgrade
# RUN apt-get install mariadb-server -y \
# 					mariadb-client

# RUN mkdir -p /var/run/mysqld \
# 	&& chown -R mysql:mysql /var/run/mysqld \
# 	&& chmod 777 /var/run/mysqld

# COPY conf/50-server.conf	/etc/mysql/my.cnf
# # /mariadb.conf.d/50-server.cnf
# COPY tools/start.sh /usr/local/bin/
# # COPY tools/comands.sql /comands.sql

# RUN chmod 755 /etc/mysql/my.cnf
# RUN chmod 755 /usr/local/bin/start.sh
# # RUN chmod +x /usr/local/bin/wordpress.sql
# # RUN chmod 755 /comands.sql

# EXPOSE 3306

# ENTRYPOINT [ "/usr/local/bin/start.sh"]

# CMD ["mysqld", "--bind-address=0.0.0.0"]

