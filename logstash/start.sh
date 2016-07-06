#!/bin/bash

CONF_DIR=/etc/logstash/conf.d

for logstash_conf in ${CONF_DIR}/*; do
    exec /opt/logstash/bin/logstash --configtest -f ${logstash_conf}
    exec /opt/logstash/bin/logstash agent -f ${logstash_conf}
done
