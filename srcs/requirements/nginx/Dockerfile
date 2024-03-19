FROM debian:11

RUN		apt-get update
RUN		apt-get install -y nginx \
                openssl

RUN mkdir -p /etc/nginx/ssl && \
    openssl req -x509 -nodes -days 365 -newkey rsa:2048 \
    -keyout /etc/nginx/ssl/nginx-selfsigned.key \
    -out /etc/nginx/ssl/nginx-selfsigned.crt \
    -subj "/C=US/ST=State/L=City/O=Organization/CN=your_domain.com"

COPY conf/nginx.conf /etc/nginx/conf.d
# COPY index.html /var/www/wordpress/index.html

RUN mkdir -p /run/nginx

EXPOSE 443

CMD ["nginx", "-g", "daemon off;"]
