FROM debian:buster

RUN		apt-get update
RUN		apt-get install -y vsftpd ftp vim

COPY conf/vsftpd.conf /etc/vsftpd.conf
COPY ./tools/scripto.sh /

RUN chmod +x scripto.sh

CMD ["/scripto.sh"]
