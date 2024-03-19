FROM debian:11

RUN apt update

RUN apt install php7.4-fpm php-mysql wget vim -y

COPY ./conf/www.conf /etc/php/7.4/fpm/pool.d/

COPY tools/script.sh /

RUN chmod +x script.sh

RUN mkdir adminer

WORKDIR /adminer

RUN wget https://www.adminer.org/static/download/4.8.0/adminer-4.8.0.php


ENTRYPOINT [ "/script.sh" ]

CMD [ "php-fpm7.4" , "-F"]