#logstash

FROM java:8-jre
MAINTAINER mmerrick

ENV LOGSTASH_VERSION 2.3

EXPOSE 9995
EXPOSE 9999

RUN apt-get update
RUN apt-get install -y wget \
    curl

RUN wget -qO - https://packages.elastic.co/GPG-KEY-elasticsearch | apt-key add -
RUN echo "deb http://packages.elastic.co/logstash/$LOGSTASH_VERSION/debian stable main" | tee -a /etc/apt/sources.list
RUN apt-get update
RUN apt-get install -y \
    logstash
COPY config/*.conf /etc/logstash/conf.d/

RUN mkdir /opt/logstash/bin/codecs
COPY codecs/*.yaml /opt/logstash/bin/codecs/

COPY start.sh /opt/logstash/bin/start.sh 
RUN chmod +x /opt/logstash/bin/start.sh

ENTRYPOINT ["/opt/logstash/bin/logstash", "-f", "/etc/logstash/conf.d"]
