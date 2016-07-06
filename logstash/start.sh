#!/bin/bash




name=logstash
pidfile="/var/run/$name.pid"

LS_USER=root
LS_GROUP=root
LS_HOME=/var/lib/logstash
LS_HEAP_SIZE="500m"
LS_LOG_DIR=/var/log/logstash
LS_LOG_FILE="${LS_LOG_DIR}/$name.log"
LS_CONF_DIR=/etc/logstash/conf.d
LS_OPEN_FILES=16384
LS_NICE=19
LS_OPTS=""


[ -r /etc/default/$name ] && . /etc/default/$name
[ -r /etc/sysconfig/$name ] && . /etc/sysconfig/$name

program=/opt/logstash/bin/logstash
args="agent -f ${LS_CONF_DIR} -l ${LS_LOG_FILE} ${LS_OPTS}"

CONF_DIR=/etc/logstash/conf.d

for logstash_conf in ${CONF_DIR}/*; do


     nice -n ${LS_NICE} chroot --userspec $LS_USER:$LS_GROUP $EXTRA_GROUPS / sh -c "
     cd $LS_HOME
     ulimit -n ${LS_OPEN_FILES}
     exec \"$program\" $args
     " > "${LS_LOG_DIR}/$logstash_file_simple.stdout" 2> "${LS_LOG_DIR}/$logstash_file_simple.err" &

done
