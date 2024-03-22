#!/bin/bash

adduser $FTP_USER --disabled-password

echo $FTP_USER:$FTP_PASS | chpasswd

chown -R $FTP_USER:$FTP_USER /ftp

mkdir empty

vsftpd /etc/vsftpd.conf