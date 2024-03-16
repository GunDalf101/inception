#!/bin/bash

adduser kaka --disabled-password

echo kaka:kaka | chpasswd

chown -R kaka:kaka /ftp

mkdir empty

vsftpd /etc/vsftpd.conf