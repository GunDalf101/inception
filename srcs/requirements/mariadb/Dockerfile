FROM debian:11

RUN apt update -y\
 && apt upgrade -y\
 && apt install mariadb-server -y

COPY config/mariadb.conf /etc/mysql/mariadb.conf.d/50-server.cnf

COPY ./tools/setup.bash /tmp

RUN chmod u=rwx /tmp/setup.bash

EXPOSE 3306 

CMD [ "bash", "/tmp/setup.bash" ]