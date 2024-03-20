FROM debian:11

EXPOSE 9000

RUN apt-get update && apt-get install -y

RUN apt-get install -y php7.4-fpm \
	php7.4-mysql \
	mariadb-client \
	curl && \
	rm -rf /var/lib/apt/lists/*

COPY ./config/www.conf /etc/php/7.4/fpm/pool.d

ADD https://wordpress.org/latest.tar.gz /var/www/latest.tar.gz

RUN cd /var/www && tar -xvf latest.tar.gz && \
	rm -rf latest.tar.gz

RUN curl https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar --output /usr/bin/wp --silent

RUN chmod +x ./usr/bin/wp

RUN mkdir /run/php
COPY ./config/wordpress.sh /tmp/wordpress.sh
RUN chmod +x /tmp/wordpress.sh
CMD ["bash", "/tmp/wordpress.sh"]