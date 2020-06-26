#!/bin/bash
echo "192.168.199.194 web1.wenzi.com" >> /etc/hosts
echo "192.168.199.178 web2.wenzi.com" >> /etc/hosts
/usr/local/tomcat8/bin/catalina.sh start
tail -f /etc/hosts
