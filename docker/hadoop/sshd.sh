#!/bin/bash
#
# 
#
# chkconfig: 345 98 30
# description:  tomcat program.
# processname: tomcat
# Source function library.
. /etc/rc.d/init.d/functions

# Source networking configuration.
#. /etc/sysconfig/network



#/usr/sbin/nscd  &
/usr/sbin/sshd -D &


exit 0
