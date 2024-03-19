FROM debian:11

RUN	apt update

RUN	apt install nginx wget -y

COPY ./conf/nginx.conf /etc/nginx/sites-enabled/

RUN mkdir /website

WORKDIR /website

COPY notindex.html /website

CMD ["nginx", "-g", "daemon off;"]