#!/bin/bash
# for userdata

/usr/bin/yum install -y httpd
/sbin/chkconfig httpd on
/bin/echo "I'm `/usr/bin/curl -s http://169.254.169.254/latest/meta-data/instance-id`" > /var/www/html/index.html
/sbin/service httpd start
