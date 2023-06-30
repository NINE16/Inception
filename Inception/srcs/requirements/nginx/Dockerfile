FROM debian:buster

RUN apt-get update -y
RUN apt-get upgrade -y
RUN apt-get install -y curl
RUN apt-get install nano
RUN apt-get install -y nginx \
						openssl
RUN apt-get install -y apt-transport-https
RUN mkdir /etc/nginx/ssl
RUN openssl req -newkey rsa:4096 -x509 -sha256 -days 365 -nodes \
					  -out /etc/nginx/ssl/nnemeth.crt \
					  -keyout /etc/nginx/ssl/nnemeth.key \
					  -subj "/C=FR/ST=Lausanne/L=Lausanne/O=42/OU=42/CN=nnemeth/UID=nnemeth"


COPY conf/nginx.conf /etc/nginx/conf.d
#conf.d/default.conf
# COPY conf/ssl_params.conf /etc/nginx/snippets/ssl-params.conf
# COPY index.html /usr/share/nginx/html/index.html

RUN mkdir -p run/nginx
# RUN rm -rf /etc/nginx/sites-available/
RUN chmod 777 /var/www/html
RUN chown -R www-data:www-data /var/www/html

EXPOSE	443

CMD ["nginx", "-g", "daemon off;"]

