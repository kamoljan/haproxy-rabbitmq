#!/usr/bin/env bash

make TARGET=linux2628

yum install gcc pcre-static pcre-devel -y
wget https://www.haproxy.org/download/1.7/src/haproxy-1.7.9.tar.gz -O ~/haproxy.tar.gz
tar xzvf ~/haproxy.tar.gz -C ~/
cd ~/haproxy-1.7.9/
make install
mkdir -p /etc/haproxy
mkdir -p /var/lib/haproxy
touch /var/lib/haproxy/stats
ln -s /usr/local/sbin/haproxy /usr/sbin/haproxy
cp ~/haproxy-1.7.9/examples/haproxy.init /etc/init.d/haproxy
chmod 755 /etc/init.d/haproxy
systemctl daemon-reload
chkconfig haproxy on
useradd -r haproxy
haproxy -v